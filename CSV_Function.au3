#include-once
;~ #include <File.au3>
;~ #include <Misc.au3>
;~ #include <Clipboard.au3>
;~ #include <GuiListView.au3>
;~ #include <GuiStatusBar.au3>
;~ #include <GUIConstantsEx.au3>
;~ #include <WindowsConstants.au3>
;~ #include <Array.au3>



; #FUNCTION# ============================================================================
; Name...........: _CSVSplit
; Description ...: Converts a string in CSV format to a two dimensional array (see comments)
; Syntax.........: _ArrayToCSV ( $aArray [, $sDelim ] )
; Parameters ....: $aArray  - The array to convert
;                  $sDelim  - Optional - Delimiter set to comma by default (see 2nd comment)
; Return values .: Success  - Returns a two dimensional array or a one dimensional array (see 1st comment)
;                  Failure  - Sets @error to:
;                 |@error = 1 - First parameter is not a valid string
;                 |@error = 2 - Second parameter is not a valid string
;                 |@error = 3 - Could not find suitable delimiter replacements
; Author ........: czardas
; Comments ......; Returns a one dimensional array if the input string does not contain the delimiter string
;                ; Some CSV formats use semicolon as a delimiter instead of a comma
;                ; Set the second parameter to @TAB To convert to TSV
; ========================================================================================

Func _CSVSplit($string, $sDelim = ",") ; Parses csv string input and returns a one or two dimensional array
	If (Not IsString($string)) Or ($string = "") Then Return SetError(1, 0, 0) ; Invalid string
	If (Not IsString($sDelim)) Or ($sDelim = "") Then Return SetError(2, 0, 0) ; Invalid string
	Local $iOverride = 255, $asDelim[3] ; $asDelim => replacements for comma, new line and double quote
	For $i = 0 To 2
		$asDelim[$i] = _GetSubstitute($string, $iOverride, $sDelim) ; Choose a suitable substitution character
		If @error Then Return SetError(3, 0, 0) ; String contains too much variety
	Next
	$iOverride = 0

	Local $aArray = StringRegExp($string, '\A[^"]+|("+[^"]+)|"+\z', 3) ; Split string using double quotes delim ... largest match
	$string = ""

	Local $iBound = UBound($aArray)
	For $i = 0 To $iBound - 1
		$iOverride += StringInStr($aArray[$i], '"', 0, -1) ; Increment by the number of adjacent double quotes per element
		If Mod($iOverride + 2, 2) = 0 Then ; Acts as an on/off switch
			$aArray[$i] = StringReplace($aArray[$i], $sDelim, $asDelim[0]) ; Replace comma delimeters
			$aArray[$i] = StringRegExpReplace($aArray[$i], "(\r\n)|[\r\n]", $asDelim[1]) ; Replace new line delimeters
		EndIf
		$aArray[$i] = StringReplace($aArray[$i], '""', $asDelim[2]) ; Replace double quote pairs
		$aArray[$i] = StringReplace($aArray[$i], '"', '') ; Delete enclosing double quotes - not paired
		$aArray[$i] = StringReplace($aArray[$i], $asDelim[2], '"') ; Reintroduce double quote pairs as single characters
		$string &= $aArray[$i] ; Rebuild the string, which includes two different delimiters
	Next
	$iOverride = 0

	$aArray = StringSplit($string, $asDelim[1], 2) ; Split to get rows
	$iBound = UBound($aArray)
	Local $aCSV[$iBound][2], $aTemp
	For $i = 0 To $iBound - 1
		$aTemp = StringSplit($aArray[$i], $asDelim[0]) ; Split to get row items
		If Not @error Then
			If $aTemp[0] > $iOverride Then
				$iOverride = $aTemp[0]
				ReDim $aCSV[$iBound][$iOverride] ; Add columns to accomodate more items
			EndIf
		EndIf
		For $j = 1 To $aTemp[0]
			If StringLen($aTemp[$j]) Then
				If Not StringRegExp($aTemp[$j], '[^"]') Then ; Field only contains double quotes
					$aTemp[$j] = StringTrimLeft($aTemp[$j], 1) ; Delete enclosing double quote single char
				EndIf
				$aCSV[$i][$j - 1] = $aTemp[$j] ; Populate each row
			EndIf
		Next
	Next

	If $iOverride > 1 Then
		Return $aCSV ; Multiple Columns
	Else
		For $i = 0 To $iBound - 1
			If StringLen($aArray[$i]) And (Not StringRegExp($aArray[$i], '[^"]')) Then ; Only contains double quotes
				$aArray[$i] = StringTrimLeft($aArray[$i], 1) ; Delete enclosing double quote single char
			EndIf
		Next
		Return $aArray ; Single column
	EndIf
EndFunc   ;==>_CSVSplit


; #FUNCTION# ============================================================================
; Name...........: _ArrayToCSV
; Description ...: Converts a two dimensional array to CSV format
; Syntax.........: _ArrayToCSV ( $aArray [, $sDelim [, $sNewLine ]] )
; Parameters ....: $aArray  - The array to convert
;                  $sDelim  - Optional - Delimiter set to comma by default (see comments)
;                  $sNewLine  - Optional - New Line set to @LF by default (see comments)
; Return values .: Success  - Returns a string in CSV format
;                  Failure  - Sets @error to:
;                 |@error = 1 - First parameter is not a valid array
;                 |@error = 2 - Second parameter is not a valid string
;                 |@error = 3 - Third parameter is not a valid string
; Author ........: czardas
; Comments ......; One dimensional arrays are returned as multiline text (without delimiters)
;                ; Some users may need to set the second parameter to semicolon to return the prefered CSV format
;                ; To convert to TSV use @TAB for the second parameter
;                ; Some users may wish to set the third parameter to @CRLF
; ========================================================================================

Func _ArrayToCSV($aArray, $sDelim = ",", $sNewLine = @LF)
	If (Not IsArray($aArray)) Or (UBound($aArray, 0) > 2) Then Return SetError(1, 0, "")
	If Not IsString($sDelim) Then Return SetError(2, 0, "")
	If Not IsString($sNewLine) Then Return SetError(3, 0, "")

	Local $iRows = UBound($aArray), $string = ""
	If UBound($aArray, 0) = 2 Then ; Check if the array has two dimensions
		Local $iCols = UBound($aArray, 2)
		For $i = 0 To $iRows - 1
			For $j = 0 To $iCols - 1
				If StringRegExp($aArray[$i][$j], '["' & $sDelim & ']') Then
					$aArray[$i][$j] = '"' & StringReplace($aArray[$i][$j], '"', '""') & '"'
				EndIf
				$string &= $aArray[$i][$j] & $sDelim
			Next
			$string = StringTrimRight($string, StringLen($sDelim)) & $sNewLine
		Next
	Else ; The delimiter is not needed
		For $i = 0 To $iRows - 1
			If StringInStr($aArray[$i], '"') Then
				$aArray[$i] = '"' & StringReplace($aArray[$i], '"', '""') & '"'
			EndIf
			$string &= $aArray[$i] & $sNewLine
		Next
	EndIf
	Return StringTrimRight($string, StringLen($sNewLine)) ; Delete any newline characters added to the end of the string
EndFunc   ;==>_ArrayToCSV


; #FUNCTION# ============================================================================
; Name...........: _GetSubstitute
; Description ...: Searches for an AscII char to be used for substitution, ie one not contained within the string
; Syntax.........: _GetSubstitute($string, ByRef $iCountdown)
; Parameters ....: $string   - The string of characters to avoid
;                  $iCountdown - The AscII number to begin checking => Best set to 255 on the first run
;                  $sAvoid   - Optional string of characters to avoid
; Return values .: Success   - Returns a suitable substitution character not found within the first parameter
;                  Failure   - Sets @error to 1 => No substitution character available
; Author ........: czardas
; Comments ......; This function is connected to the function _CSVSplit and was not intended for general use
;                ; $iCountdown is returned ByRef to avoid selecting the same character on subsequent calls
; ========================================================================================

Func _GetSubstitute($string, ByRef $iCountdown, $sAvoid = "")
	If $iCountdown < 1 Then Return SetError(1, 0, "") ; Out of options
	Local $sTestChar
	For $i = $iCountdown To 1 Step -1
		$sTestChar = Chr($i)
		$iCountdown -= 1
		If Not StringInStr($string, $sTestChar, 2) Then ; Some characters may interfere with parsing =>
			If ($i = 34) Or ($i = 13) Or ($i = 10) Or StringInStr($sAvoid, $sTestChar) Then ContinueLoop
			Return $sTestChar
		EndIf
	Next
	Return SetError(1, 0, "") ; Out of options
EndFunc   ;==>_GetSubstitute


; #INDEX# ============================================================================================================
; Title .........: _StringSize
; AutoIt Version : v3.2.12.1 or higher
; Language ......: English
; Description ...: Returns size of rectangle required to display string - maximum width can be chosen
; Remarks .......:
; Note ..........:
; Author(s) .....:  Melba23 - thanks to trancexx for the default DC code
; ====================================================================================================================

;#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

; #CURRENT# ==========================================================================================================
; _StringSize: Returns size of rectangle required to display string - maximum width can be chosen
; ====================================================================================================================

; #INTERNAL_USE_ONLY#=================================================================================================
; _StringSize_Error_Close: Releases DC and deletes font object after error
; _StringSize_DefaultFontName: Determines Windows default font
; ====================================================================================================================

; #FUNCTION# =========================================================================================================
; Name...........: _StringSize
; Description ...: Returns size of rectangle required to display string - maximum permitted width can be chosen
; Syntax ........: _StringSize($sText[, $iSize[, $iWeight[, $iAttrib[, $sName[, $iWidth[, $hWnd]]]]]])
; Parameters ....: $sText   - String to display
;                  $iSize   - [optional] Font size in points - (default = 8.5)
;                  $iWeight - [optional] Font weight - (default = 400 = normal)
;                  $iAttrib - [optional] Font attribute (0-Normal (default), 2-Italic, 4-Underline, 8 Strike)
;                             + 1 if tabs are to be expanded before sizing
;                  $sName   - [optional] Font name - (default = Tahoma)
;                  $iWidth  - [optional] Max width for rectangle - (default = 0 => width of original string)
;                  $hWnd    - [optional] GUI in which string will be displayed - (default 0 => normally not required)
; Requirement(s) : v3.2.12.1 or higher
; Return values .: Success - Returns 4-element array: ($iWidth set // $iWidth not set)
;                  |$array[0] = String reformatted with additonal @CRLF // Original string
;                  |$array[1] = Height of single line in selected font // idem
;                  |$array[2] = Width of rectangle required for reformatted // original string
;                  |$array[3] = Height of rectangle required for reformatted // original string
;                  Failure - Returns 0 and sets @error:
;                  |1 - Incorrect parameter type (@extended = parameter index)
;                  |2 - DLL call error - extended set as follows:
;                       |1 - GetDC failure
;                       |2 - SendMessage failure
;                       |3 - GetDeviceCaps failure
;                       |4 - CreateFont failure
;                       |5 - SelectObject failure
;                       |6 - GetTextExtentPoint32 failure
;                  |3 - Font too large for chosen max width - a word will not fit
; Author ........: Melba23 - thanks to trancexx for the default DC code
; Modified ......:
; Remarks .......: The use of the $hWnd parameter is not normally necessary - it is only required if the UDF does not
;                   return correct dimensions without it.
; Related .......:
; Link ..........:
; Example .......: Yes
;=====================================================================================================================
Func _StringSize($sText, $iSize = 8.5, $iWeight = 400, $iAttrib = 0, $sName = "", $iMaxWidth = 0, $hWnd = 0)

	; Set parameters passed as Default
	If $iSize = Default Then $iSize = 8.5
	If $iWeight = Default Then $iWeight = 400
	If $iAttrib = Default Then $iAttrib = 0
	If $sName = "" Or $sName = Default Then $sName = _StringSize_DefaultFontName()

	; Check parameters are correct type
	If Not IsString($sText) Then Return SetError(1, 1, 0)
	If Not IsNumber($iSize) Then Return SetError(1, 2, 0)
	If Not IsInt($iWeight) Then Return SetError(1, 3, 0)
	If Not IsInt($iAttrib) Then Return SetError(1, 4, 0)
	If Not IsString($sName) Then Return SetError(1, 5, 0)
	If Not IsNumber($iMaxWidth) Then Return SetError(1, 6, 0)
	If Not IsHWnd($hWnd) And $hWnd <> 0 Then Return SetError(1, 7, 0)

	Local $aRet, $hDC, $hFont, $hLabel = 0, $hLabel_Handle

	; Check for tab expansion flag
	Local $iExpTab = BitAND($iAttrib, 1)
	; Remove possible tab expansion flag from font attribute value
	$iAttrib = BitAND($iAttrib, BitNOT(1))

	; If GUI handle was passed
	If IsHWnd($hWnd) Then
		; Create label outside GUI borders
		$hLabel = GUICtrlCreateLabel("", -10, -10, 10, 10)
		$hLabel_Handle = GUICtrlGetHandle(-1)
		GUICtrlSetFont(-1, $iSize, $iWeight, $iAttrib, $sName)
		; Create DC
		$aRet = DllCall("user32.dll", "handle", "GetDC", "hwnd", $hLabel_Handle)
		If @error Or $aRet[0] = 0 Then
			GUICtrlDelete($hLabel)
			Return SetError(2, 1, 0)
		EndIf
		$hDC = $aRet[0]
		$aRet = DllCall("user32.dll", "lparam", "SendMessage", "hwnd", $hLabel_Handle, "int", 0x0031, "wparam", 0, "lparam", 0) ; $WM_GetFont
		If @error Or $aRet[0] = 0 Then
			GUICtrlDelete($hLabel)
			Return SetError(2, _StringSize_Error_Close(2, $hDC), 0)
		EndIf
		$hFont = $aRet[0]
	Else
		; Get default DC
		$aRet = DllCall("user32.dll", "handle", "GetDC", "hwnd", $hWnd)
		If @error Or $aRet[0] = 0 Then Return SetError(2, 1, 0)
		$hDC = $aRet[0]
		; Create required font
		$aRet = DllCall("gdi32.dll", "int", "GetDeviceCaps", "handle", $hDC, "int", 90) ; $LOGPIXELSY
		If @error Or $aRet[0] = 0 Then Return SetError(2, _StringSize_Error_Close(3, $hDC), 0)
		Local $iInfo = $aRet[0]
		$aRet = DllCall("gdi32.dll", "handle", "CreateFontW", "int", -$iInfo * $iSize / 72, "int", 0, "int", 0, "int", 0, _
				"int", $iWeight, "dword", BitAND($iAttrib, 2), "dword", BitAND($iAttrib, 4), "dword", BitAND($iAttrib, 8), "dword", 0, "dword", 0, _
				"dword", 0, "dword", 5, "dword", 0, "wstr", $sName)
		If @error Or $aRet[0] = 0 Then Return SetError(2, _StringSize_Error_Close(4, $hDC), 0)
		$hFont = $aRet[0]
	EndIf

	; Select font and store previous font
	$aRet = DllCall("gdi32.dll", "handle", "SelectObject", "handle", $hDC, "handle", $hFont)
	If @error Or $aRet[0] = 0 Then Return SetError(2, _StringSize_Error_Close(5, $hDC, $hFont, $hLabel), 0)
	Local $hPrevFont = $aRet[0]

	; Declare variables
	Local $avSize_Info[4], $iLine_Length, $iLine_Height = 0, $iLine_Count = 0, $iLine_Width = 0, $iWrap_Count, $iLast_Word, $sTest_Line
	; Declare and fill Size structure
	Local $tSize = DllStructCreate("int X;int Y")
	DllStructSetData($tSize, "X", 0)
	DllStructSetData($tSize, "Y", 0)

	; Ensure EoL is @CRLF and break text into lines
	$sText = StringRegExpReplace($sText, "((?<!\x0d)\x0a|\x0d(?!\x0a))", @CRLF)
	Local $asLines = StringSplit($sText, @CRLF, 1)

	; For each line
	For $i = 1 To $asLines[0]
		; Expand tabs if required
		If $iExpTab Then
			$asLines[$i] = StringReplace($asLines[$i], @TAB, " XXXXXXXX")
		EndIf
		; Size line
		$iLine_Length = StringLen($asLines[$i])
		DllCall("gdi32.dll", "bool", "GetTextExtentPoint32W", "handle", $hDC, "wstr", $asLines[$i], "int", $iLine_Length, "ptr", DllStructGetPtr($tSize))
		If @error Then Return SetError(2, _StringSize_Error_Close(6, $hDC, $hFont, $hLabel), 0)
		If DllStructGetData($tSize, "X") > $iLine_Width Then $iLine_Width = DllStructGetData($tSize, "X")
		If DllStructGetData($tSize, "Y") > $iLine_Height Then $iLine_Height = DllStructGetData($tSize, "Y")
	Next

	; Check if $iMaxWidth has been both set and exceeded
	If $iMaxWidth <> 0 And $iLine_Width > $iMaxWidth Then ; Wrapping required
		; For each Line
		For $j = 1 To $asLines[0]
			; Size line unwrapped
			$iLine_Length = StringLen($asLines[$j])
			DllCall("gdi32.dll", "bool", "GetTextExtentPoint32W", "handle", $hDC, "wstr", $asLines[$j], "int", $iLine_Length, "ptr", DllStructGetPtr($tSize))
			If @error Then Return SetError(2, _StringSize_Error_Close(6, $hDC, $hFont, $hLabel), 0)
			; Check wrap status
			If DllStructGetData($tSize, "X") < $iMaxWidth - 4 Then
				; No wrap needed so count line and store
				$iLine_Count += 1
				$avSize_Info[0] &= $asLines[$j] & @CRLF
			Else
				; Wrap needed so zero counter for wrapped lines
				$iWrap_Count = 0
				; Build line to max width
				While 1
					; Zero line width
					$iLine_Width = 0
					; Initialise pointer for end of word
					$iLast_Word = 0
					; Add characters until EOL or maximum width reached
					For $i = 1 To StringLen($asLines[$j])
						; Is this just past a word ending?
						If StringMid($asLines[$j], $i, 1) = " " Then $iLast_Word = $i - 1
						; Increase line by one character
						$sTest_Line = StringMid($asLines[$j], 1, $i)
						; Get line length
						$iLine_Length = StringLen($sTest_Line)
						DllCall("gdi32.dll", "bool", "GetTextExtentPoint32W", "handle", $hDC, "wstr", $sTest_Line, "int", $iLine_Length, "ptr", DllStructGetPtr($tSize))
						If @error Then Return SetError(2, _StringSize_Error_Close(6, $hDC, $hFont, $hLabel), 0)
						$iLine_Width = DllStructGetData($tSize, "X")
						; If too long exit the loop
						If $iLine_Width >= $iMaxWidth - 4 Then ExitLoop
					Next
					; End of the line of text?
					If $i > StringLen($asLines[$j]) Then
						; Yes, so add final line to count
						$iWrap_Count += 1
						; Store line
						$avSize_Info[0] &= $sTest_Line & @CRLF
						ExitLoop
					Else
						; No, but add line just completed to count
						$iWrap_Count += 1
						; Check at least 1 word completed or return error
						If $iLast_Word = 0 Then Return SetError(3, _StringSize_Error_Close(0, $hDC, $hFont, $hLabel), 0)
						; Store line up to end of last word
						$avSize_Info[0] &= StringLeft($sTest_Line, $iLast_Word) & @CRLF
						; Strip string to point reached
						$asLines[$j] = StringTrimLeft($asLines[$j], $iLast_Word)
						; Trim leading whitespace
						$asLines[$j] = StringStripWS($asLines[$j], 1)
						; Repeat with remaining characters in line
					EndIf
				WEnd
				; Add the number of wrapped lines to the count
				$iLine_Count += $iWrap_Count
			EndIf
		Next
		; Reset any tab expansions
		If $iExpTab Then
			$avSize_Info[0] = StringRegExpReplace($avSize_Info[0], "\x20?XXXXXXXX", @TAB)
		EndIf
		; Complete return array
		$avSize_Info[1] = $iLine_Height
		$avSize_Info[2] = $iMaxWidth
		; Convert lines to pixels and add drop margin
		$avSize_Info[3] = ($iLine_Count * $iLine_Height) + 4
	Else ; No wrapping required
		; Create return array (add drop margin to height)
		Local $avSize_Info[4] = [$sText, $iLine_Height, $iLine_Width, ($asLines[0] * $iLine_Height) + 4]
	EndIf

	; Clear up
	DllCall("gdi32.dll", "handle", "SelectObject", "handle", $hDC, "handle", $hPrevFont)
	DllCall("gdi32.dll", "bool", "DeleteObject", "handle", $hFont)
	DllCall("user32.dll", "int", "ReleaseDC", "hwnd", 0, "handle", $hDC)
	If $hLabel Then GUICtrlDelete($hLabel)

	Return $avSize_Info

EndFunc   ;==>_StringSize

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _StringSize_Error_Close
; Description ...: Releases DC and deleted font object if required after error
; Syntax ........: _StringSize_Error_Close ($iExtCode, $hDC, $hGUI)
; Parameters ....: $iExtCode   - code to return
;                  $hDC, $hGUI - handles as set in _StringSize function
; Return value ..: $iExtCode as passed
; Author ........: Melba23
; Modified.......:
; Remarks .......: This function is used internally by _StringSize
; ===============================================================================================================================
Func _StringSize_Error_Close($iExtCode, $hDC = 0, $hFont = 0, $hLabel = 0)

	If $hFont <> 0 Then DllCall("gdi32.dll", "bool", "DeleteObject", "handle", $hFont)
	If $hDC <> 0 Then DllCall("user32.dll", "int", "ReleaseDC", "hwnd", 0, "handle", $hDC)
	If $hLabel Then GUICtrlDelete($hLabel)

	Return $iExtCode

EndFunc   ;==>_StringSize_Error_Close

; #INTERNAL_USE_ONLY#============================================================================================================
; Name...........: _StringSize_DefaultFontName
; Description ...: Determines Windows default font
; Syntax ........: _StringSize_DefaultFontName()
; Parameters ....: None
; Return values .: Success - Returns name of system default font
;                  Failure - Returns "Tahoma"
; Author ........: Melba23, based on some original code by Larrydalooza
; Modified.......:
; Remarks .......: This function is used internally by _StringSize
; ===============================================================================================================================
Func _StringSize_DefaultFontName()

	; Get default system font data
	Local $tNONCLIENTMETRICS = DllStructCreate("uint;int;int;int;int;int;byte[60];int;int;byte[60];int;int;byte[60];byte[60];byte[60]")
	DllStructSetData($tNONCLIENTMETRICS, 1, DllStructGetSize($tNONCLIENTMETRICS))
	DllCall("user32.dll", "int", "SystemParametersInfo", "int", 41, "int", DllStructGetSize($tNONCLIENTMETRICS), "ptr", DllStructGetPtr($tNONCLIENTMETRICS), "int", 0)
	Local $tLOGFONT = DllStructCreate("long;long;long;long;long;byte;byte;byte;byte;byte;byte;byte;byte;char[32]", DllStructGetPtr($tNONCLIENTMETRICS, 13))
	If IsString(DllStructGetData($tLOGFONT, 14)) Then
		Return DllStructGetData($tLOGFONT, 14)
	Else
		Return "Tahoma"
	EndIf

EndFunc   ;==>_StringSize_DefaultFontName