;_ArrayView2D1D.au3 0_4 
#include-once
#include "_GUICtrlListView.au3" ;_108
#include "Array2D.au3"
Global $searchlistView
Func _ArrayView2D1D($ar_2DArray, $sTitle = "Title", $i_CheckForEmpty = 1, $i_ShowOver4000 = 0, $i_Transpose = 0)
	If Not IsArray($ar_2DArray) Then Return
	Local $ar_TempSingle, $i_StartColumn, $i_StartRow
	Local $editCtrl = "Edit1";name of the Edit control that pops up when edit a listitem....
	Local $editFlag = 0, $start, $diff, $doubleclicked;, $msg, $listview, $Gui
	$searchGUI = GUICreate($sTitle, 810, 623, (@DesktopWidth - 800) / 2, (@DesktopHeight - 600) / 2, $WS_MAXIMIZEBOX + $WS_MINIMIZEBOX)
	$searchGUI_Transpose = GUICtrlCreateButton("&Transpose", 10, 550, 70, 24)
	GUICtrlSetResizing($searchGUI_Transpose, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($searchGUI_Transpose, ($GUI_DefButton))
;~ 	_LockAndWait3 ()
	_ArrayView2D1Dsub($ar_2DArray, $searchlistView, $sTitle, $i_CheckForEmpty, $i_ShowOver4000, $i_Transpose)
;~ 	_ResetLockWait3 ()
	$i_Transpose = _Iif($i_Transpose = 1, 0, 1)
	GUISetState()
	;GUISetState(@SW_MAXIMIZE)
	Do
		$dll = DllOpen("user32.dll")
		$msg = GUIGetMsg(1)
		If $msg[0] = $GUI_EVENT_PRIMARYDOWN Then
			Local $focus = ControlGetFocus(WinGetTitle($searchGUI))
			If (StringInStr($focus, "SysListView3")) Then
				$diff = TimerDiff($start)
				$mousespeed = RegRead("HKCU\Control Panel\Mouse", "DoubleClickSpeed")
				If $mousespeed = "" Then $mousespeed = 500
				If $diff < $mousespeed And $doubleclicked = 0 Then
					DllClose($dll)
					$ar_Items = _GUICtrlListViewGetItemTextArray($searchlistView)
					If IsArray($ar_Items) Then
						$rowIndex = Number($ar_Items[UBound($ar_Items) - 1]) - 1
						If ($rowIndex > -1) Then
							$ar_SingleArray = StringSplit($ar_TempSingle[ $rowIndex], "|")
							_ArrayDelete($ar_SingleArray, 0)
							_Main ($ar_SingleArray)
							$sTemp = _ArrayToString($ar_SingleArray, "|")
							$ar_TempSingle[ $rowIndex] = $sTemp
;~ 							_ArrayReplace2DRowst( $ar_2DArray,$sTemp,  $rowIndex)
							_LockAndWait3 ()
							_GUICtrlListViewInsertItem($searchlistView, $rowIndex, $sTemp & "|" & $rowIndex + 1)
							_GUICtrlListViewDeleteItemsSelected($searchlistView)
							_ResetLockWait3 ()
							$dll = DllOpen("user32.dll")
							$doubleclicked = 1
						EndIf
					EndIf
				Else
					$doubleclicked = 0
				EndIf
				$start = TimerInit()
			EndIf
		EndIf
		Select
			Case $msg[0] = $searchGUI_Transpose
				_LockAndWait3 ()
				__GUICtrlListViewDeleteAllItems ($searchlistView);, 0)
				_ResetLockWait3 ()
				_ArrayView2D1Dsub($ar_2DArray, $searchlistView, $sTitle, $i_CheckForEmpty, $i_ShowOver4000, $i_Transpose)
			Case $msg[0] = $searchlistView
				_LockAndWait3 ()
				__GUICtrlListViewSort ($searchlistView, $B_DESCENDING, GUICtrlGetState($searchlistView), 1, $i_CheckForEmpty)
				_ResetLockWait3 ()
		EndSelect
		DllClose($dll)
	Until $msg[0] = $GUI_EVENT_CLOSE
	__GUICtrlListViewDeleteAllItems ($searchlistView, 0)
	GUIDelete($searchGUI)
EndFunc   ;==>_ArrayView2D1D
Func _ArrayView2D1Dsub(ByRef $ar_2DArrayF, ByRef $searchlistViewF, $sTitle = "Title", $i_CheckForEmptyF = 1, $i_ShowOver4000F = 0, $i_TransposeF = 0)
	If Not IsArray($ar_2DArrayF) Then Return
	Local $ar_TempSingleF;, $i_StartColumn, $i_StartRow
	If UBound($ar_2DArrayF, 0) = 1 And (StringInStr($ar_2DArrayF[0], "|") Or StringInStr($ar_2DArrayF[1], "|")) Then
		$ar_Array2d = _Array2DCreateFromArraySt ($ar_2DArrayF) ;do this to convert 1D to 2D easily and regular lengths
		$ar_2DArrayF = $ar_Array2d
	EndIf
;~ 	if $i_TransposeF then _Array2DTranspose($ar_2DArrayF)
	If $i_TransposeF And (UBound($ar_2DArrayF, 0) = 2) Then _Array2DTranspose ($ar_2DArrayF)
	If UBound($ar_2DArrayF, 0) = 2 Then
		_Array2DToArStrings ($ar_2DArrayF, $ar_TempSingleF)
	Else
		$ar_TempSingleF = $ar_2DArrayF
	EndIf
	$sTempHeader = 'Col0'
;~ 	$Array2D1DF = StringSplit($ar_TempSingle[0], "|")
	For $i = 2 To UBound($ar_2DArrayF, 2)
		$sTempHeader &= '|Col ' & $i - 1
	Next
;~ 	MsgBox(0,"","$sTempHeader="&$sTempHeader)
	GUICtrlDelete($searchlistViewF)
	$searchlistViewF = _GuiCtrlCreateListViewIndexed ($sTempHeader, 0, 16, 790, 530, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
	GUICtrlSetResizing($searchlistViewF, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
;~  	$searchlistViewF = _GuiCtrlCreateListViewIndexed ($sTempHeader, 10, 10, 790, 530, $LVS_REPORT)
	$statuslabel = GUICtrlCreateLabel("", 10, 580, 790, 20)
	$i_Quick = 0
	If Not ((UBound($ar_TempSingleF) - 1 > 4000) And $i_ShowOver4000F) And Not $GUICtrlSetImage And Not $i_GUISetCheckBoxes Then $i_Quick = 1
	ConsoleWrite("$i_Quick=" & $i_Quick & @LF)
	$timerstamp0 = TimerInit()
	_LockAndWait3 ()
	For $c = 0 To UBound($ar_TempSingleF) - 1
		If ($c < 4000) Or $i_ShowOver4000F Then
;~ 			ConsoleWrite("UBound( $ar_LISTVIEWArray)-1="&UBound( $ar_LISTVIEWArray)-1&@LF&"$c="&$c&@LF)
;~ 			If $i_ShowOver4000F then ConsoleWrite($i_ShowOver4000F&@LF)
			_GUICtrlCreateListViewItem ($ar_TempSingleF[$c], $searchlistViewF, -1, $i_Quick, 1)
		ElseIf ($c >= 4000) Then
			ExitLoop
		EndIf
	Next
	_GUIListViewReDim ()
	_ResetLockWait3 ()
EndFunc   ;==>_ArrayView2D1Dsub
Func _hndButton_Array2Box_Transpose($hndListView_Array1Box_Display, $ar_Array2DF, $sTitle, $i_StartRow, $i_StartColumn, $i_ZeroRowAsHeader, ByRef $i_Transpose, $Width = 500, $Height = 500, $Left = -1, $Top = -1, $i_CheckForEmpty = 1, $i_ShowOver4000 = 0, $i_Quick = 0)
	_LockAndWait ()
	ReDim $ar_LISTVIEWArray[4000]
	ReDim $ar_LISTVIEW[4000]
	$i_Quick = 0
	If Not ((UBound($ar_Array2DF) - 1 > 4000) And $i_ShowOver4000) And Not $GUICtrlSetImage And Not $i_GUISetCheckBoxes Then $i_Quick = 1
	$ArrayDimensions = UBound($ar_Array2DF, 0)
	If $ArrayDimensions = 2 Then
		_GUICtrlListViewDeleteAllItems($hndListView_Array1Box_Display)
		If $i_Transpose = 0 Then
			$i_Transpose = 1
			$Dim1 = 2
			$Dim2 = 1
			$sTemp = 'Index'
			For $i = 0 To UBound($ar_Array2DF, $Dim2) - 1
				$sTemp &= '|' & $i
			Next
			GUICtrlDelete($hndListView_Array1Box_Display)
			$hndListView_Array1Box_Display = _GUICtrlCreateListView ($sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
			GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
			For $i = 0 To UBound($ar_Array2DF, $Dim1) - 1
				$sTemp = $ar_Array2DF[0][$i]
				For $j = 1 To UBound($ar_Array2DF, $Dim2) - 1
					$sTemp = $sTemp & '|' & $ar_Array2DF[$j][$i]
				Next ;$j
				If $i_ZeroRowAsHeader = 1 And $i = 0 Then
					$sTemp = $sTemp & '|';& '|'
					GUICtrlDelete($hndListView_Array1Box_Display)
					$hndListView_Array1Box_Display = _GUICtrlCreateListView ("Index|" & $sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
					GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
				EndIf
				If ($i < 4000) Or $i_ShowOver4000 Then
					If ($i = 0 And $i_StartColumn = 0) Or ($i > 0) Then _GUICtrlCreateListViewItem ('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display, -1, 0)
;~ 					If ($i = 0 And $i_StartColumn = 0) Or ($i > 0) Then _GUICtrlCreateListViewItem ('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display, -1, $i_Quick, 1)
				ElseIf ($i >= 4000) Then
					ExitLoop
				EndIf
				If $i_StartRow Then _GUICtrlListViewHideColumn($hndListView_Array1Box_Display, 1)
			Next ;$i						Next ;$i
			_GUIListViewReDim ()
		Else
			$i_Transpose = 0
			$Dim1 = 1
			$Dim2 = 2
			$sTemp = 'Index'
			For $i = 0 To UBound($ar_Array2DF, $Dim2) - 1
				$sTemp = $sTemp & '|' & $i
			Next
			GUICtrlDelete($hndListView_Array1Box_Display)
			$hndListView_Array1Box_Display = _GUICtrlCreateListView ($sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
			GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
			For $i = 0 To UBound($ar_Array2DF, $Dim1) - 1
				$sTemp = $ar_Array2DF[$i][0]
				For $j = 1 To UBound($ar_Array2DF, $Dim2) - 1
					$sTemp = $sTemp & '|' & $ar_Array2DF[$i][$j]
				Next ;$j
				If $i_ZeroRowAsHeader = 1 And $i = 0 Then
					$sTemp = $sTemp & '|';& '|'
					GUICtrlDelete($hndListView_Array1Box_Display)
					$hndListView_Array1Box_Display = _GUICtrlCreateListView ("Index|" & $sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
					GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
				EndIf
				If ($i < 4000) Or $i_ShowOver4000 Then
					If ($i = 0 And $i_StartColumn = 0) Or ($i > 0) Then _GUICtrlCreateListViewItem ('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display, -1, 0)
;~ 					If ($i = 0 And $i_StartColumn = 0) Or ($i > 0) Then _GUICtrlCreateListViewItem ('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display, -1, $i_Quick, 1)
				ElseIf ($i >= 4000) Then
					ExitLoop
				EndIf
				If $i_StartColumn = 1 Then _GUICtrlListViewHideColumn($hndListView_Array1Box_Display, 1)
			Next ;$i
			_GUIListViewReDim ()
		EndIf
	EndIf
	_ResetLockWait ()
EndFunc   ;==>_hndButton_Array2Box_Transpose
Func _ArrayViewTextGUI($ar_Array2DF, $sTitle = 'Array Box', $i_StartRow = 0, $i_StartColumn = 0, $i_ZeroRowAsHeader = 0, $i_Transpose = 0, $Width = 800, $Height = 600, $Left = -1, $Top = -1, $i_CheckForEmpty = 1, $i_ShowOver4000 = 0) ;,$Displayindex=1, $ZeroRowAsHeader=0)
;~ Func _ArrayViewText(ByRef $ar_Array2DF, $sTitle = 'Array Box', $i_StartRow = 0, $i_StartColumn = 0, $i_ZeroRowAsHeader = 0, $i_Transpose = 0, $Width = 800, $Height = 600, $Left = -1, $Top = -1) ;,$Displayindex=1, $ZeroRowAsHeader=0)
	;===============================================================================
	;_ArrayViewText($ar3_Array, 'Title',  $i_RowStart, $i_ColumnStart, $i_ZeroRowAsHeader,$Transpose,  $Width, $Height, $Left, $Right)
	; Function Name: _ArrayViewText  ; was _Array1Box()
	; Description: Shows an array in a GUI window. Improved version of _Array1Display
	; Parameter(s): $ar_Array2DF - An array, 1d or 2d, 0-based or 1-based
	; $i_StartRow ; 1 or 0 or 2- tells whether to display first (zero) array row
	; $i_StartColumn ; 1 or 0 or 2- tells whether to display first (zero) array Column
	; $i_Transpose ;1 or 0 - tells when to transpose display
	; $ZeroRowAsHeader ; 1 or 0  tells how to display Header
	; $sTitle - the title to put on the output window
	; $Width, $Height, $Left, $Top - Set the size and position of the output window
	; Requirement(s): $ar_Array2DF must be 1d or 2d.
	; Return Value(s): Integer, 0 or more = 0-based index of selected item
	;                  -1 = no item was selected
	;                  Error=1 = $ar_Array2DF is not an array
	; Author(s): Mike Ratzlaff <mike@ratzlaff.org> // modified randall Clapp <randallc@ozemail.com.au>
	; Revision: 20050728A
	;
	;===============================================================================
	If Not IsArray($ar_Array2DF) Then Return
	Local $AllDone = 0, $msg, $i, $j, $ArrayMax, $sTemp
	Local $hndForm_Array1Box_Main, $hndListView_Array1Box_Display, $hndButton_Array1Box_Close
	Local $sTxtFile, $i_TempStartColumn = 0
	$Dim1 = 1
	$Dim2 = 2
	If UBound($ar_Array2DF, 2) <= 1 And (StringInStr($ar_Array2DF[0], "|") Or StringInStr($ar_Array2DF[1], "|")) Then
		$ar_Array2d = _Array2DCreateFromArraySt ($ar_Array2DF)
		$ar_Array2DF = $ar_Array2d
	EndIf
	$ArrayDimensions = UBound($ar_Array2DF, 0)
	If $i_Transpose = 1 Then
		$Dim1 = 2
		$Dim2 = 1
	EndIf
	If ($i_Transpose = 1 And $i_StartRow = 1) Or ($i_Transpose = 0 And $i_StartColumn = 1) Then
		$i_TempStartColumn = 1
	EndIf
	If $ArrayDimensions = 0 Then
		SetError(1)
		Return 'Given variable is not an array'
	EndIf
	Select
		Case $ArrayDimensions = 1
			$ArrayMax = UBound($ar_Array2DF) - 1
		Case $ArrayDimensions = 2
			$ArrayMax = UBound($ar_Array2DF, $Dim1) - 1
	EndSelect
	If $Height < 100 Then $Height = 100
	If $Width < 500 Then $Width = 500
	$hndForm_Array1Box_Main = GUICreate($sTitle, $Width, $Height, $Left, $Top, $WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPSIBLINGS)
	Local $editCtrl = "Edit1";name of the Edit control that pops up when edit a listitem....
	Local $editFlag = 0, $start, $diff, $doubleclicked;, $msg, $listview, $Gui
	If $ArrayDimensions = 1 Then
		$sTemp = 'Index|Value'
	ElseIf $ArrayDimensions = 2 Then
		$sTemp = 'Index'
		For $i = $i_TempStartColumn To UBound($ar_Array2DF, $Dim2) - 1
			$sTemp = $sTemp & '|' & $i
		Next
	EndIf
	GUICtrlCreateLabel('Basic Array Rows = (' & UBound($ar_Array2DF) & ')' & '.....Basic Array Columns = (' & UBound($ar_Array2DF, 2) & ')', 0, 0, $Width, 16)
	$i_Quick = 0
	If Not ((UBound($ar_Array2DF) - 1 > 4000) And $i_ShowOver4000) And Not $GUICtrlSetImage And Not $i_GUISetCheckBoxes Then $i_Quick = 1
	GUICtrlSetResizing(-1, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DOCKHEIGHT))
	$hndListView_Array1Box_Display = _GUICtrlCreateListView ($sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
	GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
	;Create Controls, Show GUI
	$hndButton_Array1Box_Close = GUICtrlCreateButton('&Close', $Width - 80, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_Close, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_Close, BitOR($GUI_DefButton, $GUI_FOCUS))
	$hndButton_Array1Box_Transpose = GUICtrlCreateButton('&Transpose', $Width - 160, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_Transpose, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_Transpose, ($GUI_DefButton))
	$hndButton_Array1Box_Header = GUICtrlCreateButton('&Header', $Width - 240, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_Header, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_Header, ($GUI_DefButton))
	$hndButton_Array1Box_ZeroRow = GUICtrlCreateButton('&ZeroRow', $Width - 320, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_ZeroRow, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_ZeroRow, ($GUI_DefButton))
	$hndButton_Array1Box_ZeroColumn = GUICtrlCreateButton('&ZeroColumn', $Width - 400, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_ZeroColumn, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_ZeroColumn, ($GUI_DefButton))
	$hndButton_Array1Box_TextSelect = GUICtrlCreateButton('&Text' & 'Selected', $Width - 480, $Height - 24, 70, 24)
	GUICtrlSetResizing($hndButton_Array1Box_TextSelect, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	GUICtrlSetState($hndButton_Array1Box_TextSelect, ($GUI_DefButton))
	;$hndButton_Array1Box_ExcelSelect = GUICtrlCreateButton('&Excel' & 'Selected', $Width - 280, $Height - 24, 80, 24)
	;GUICtrlSetResizing($hndButton_Array1Box_ExcelSelect, BitOR($GUI_DockRight, $GUI_DockBottom, $GUI_DockSize))
	;GUICtrlSetState($hndButton_Array1Box_ExcelSelect, ($GUI_DefButton))
;~ 	GUISetState(@SW_MAXIMIZE, $hndForm_Array1Box_Main)
	GUISetState(@SW_SHOW, $hndForm_Array1Box_Main)
	Dim $B_DESCENDING[_GUICtrlListViewGetSubItemsCount($hndListView_Array1Box_Display) ]
	;Display Array
	Select
		Case $ArrayDimensions = 1  ;1-Dimensional Array
			ReDim $ar_LISTVIEWArray[4000]
			ReDim $ar_LISTVIEW[4000]
			For $i = 0 To $ArrayMax
				If ($i < 4000) Or $i_ShowOver4000 Then
					_GUICtrlCreateListViewItem ($i & '|' & $ar_Array2DF[$i], $hndListView_Array1Box_Display, -1, 0)
				ElseIf ($i >= 4000) Then
					ExitLoop
				EndIf
			Next
			_GUIListViewReDim ()
;~ 			Next  ;$i
		Case ($ArrayDimensions = 2) ;And ($i_Transpose = 0) and $i_StartColumn=1000;2-Dimensional Array
			;==============================================================================================
			_LockAndWait ()
			ReDim $ar_LISTVIEWArray[4000]
			ReDim $ar_LISTVIEW[4000]
			$sTemp = 'Index'
			For $i = 0 To UBound($ar_Array2DF, 2) - 1
				$sTemp = $sTemp & '|' & $i
			Next
			GUICtrlDelete($hndListView_Array1Box_Display)
			$hndListView_Array1Box_Display = _GUICtrlCreateListView ($sTemp, 0, 16, $Width, $Height - 40, BitOR($LVS_SHOWSELALWAYS, $LVS_EDITLABELS), BitOR($LVS_EX_GRIDLINES, $LVS_EX_HEADERDRAGDROP, $LVS_EX_FULLROWSELECT, $LVS_EX_REGIONAL))
			GUICtrlSetResizing($hndListView_Array1Box_Display, BitOR($GUI_DockLeft, $GUI_DockTop, $GUI_DockRight, $GUI_DockBottom))
			For $i = 0 To UBound($ar_Array2DF, 1) - 1
				$sTemp = $ar_Array2DF[$i][0]
				For $j = 1 To UBound($ar_Array2DF, 2) - 1
					$sTemp = $sTemp & '|' & $ar_Array2DF[$i][$j]
				Next ;$j
				If ($i < 4000) Or $i_ShowOver4000 Then
;~ 					_GUICtrlCreateListViewItem ($i & '|' & $ar_Array2DF[$i], $hndListView_Array1Box_Display, -1, $i_Quick, 1)
					_GUICtrlCreateListViewItem ('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display, -1, 0)
;~ 					_GUICtrlCreateListViewItem ('[' & StringRight('     ' & $i, 4) & ']|' & $sTemp, $hndListView_Array1Box_Display, -1, $i_Quick, 1)
				ElseIf ($i >= 4000) Then
					ExitLoop
				EndIf
			Next
			_GUIListViewReDim ()
;~ 			Next ;$i
			If ($ArrayDimensions = 2) And ($i_Transpose = 1) Then
				$i_Transpose = _Iif($i_Transpose = 1, 0, 1)
				_hndButton_Array2Box_Transpose($hndListView_Array1Box_Display, $ar_Array2DF, $sTitle, $i_StartRow, $i_StartColumn, $i_ZeroRowAsHeader, $i_Transpose, $Width, $Height, $Left, $Top, $i_CheckForEmpty, $i_ShowOver4000, $i_Quick)
			Else
				_ResetLockWait ()
			EndIf
			;==============================================================================================
		Case Else ;Unhandled Type
	EndSelect
	Do
		$dll = DllOpen("user32.dll")
		$msg = GUIGetMsg(1)
		If $msg[0] = $GUI_EVENT_PRIMARYDOWN Then
			Local $focus = ControlGetFocus(WinGetTitle($hndForm_Array1Box_Main))
			If (StringInStr($focus, "SysListView3")) Then
				$diff = TimerDiff($start)
				; Read the current mouse-doubleclick-settings from registry
				$mousespeed = RegRead("HKCU\Control Panel\Mouse", "DoubleClickSpeed")
				If $mousespeed = "" Then $mousespeed = 500
				If $diff < $mousespeed And $doubleclicked = 0 Then
					DllClose($dll)
					$ar_Items = _GUICtrlListViewGetItemTextArray($hndListView_Array1Box_Display)
					If IsArray($ar_Items) Then
						$rowIndex = Number(StringReplace(StringReplace($ar_Items[1], "[", ""), "]", ""))
						If ($rowIndex > -1) Then
							$ar_SingleArray = _Array2DToDau3 ($ar_Array2DF, $sTitle, 0, $rowIndex , ($i_Transpose = 0))
							_Main ($ar_SingleArray)
							$sTemp = _ArrayToString($ar_SingleArray, "|")
							If $i_Transpose = 1 Then _ArrayReplace2DColumnSt ($ar_Array2DF, $sTemp, $rowIndex)
							If $i_Transpose = 0 Then _ArrayReplace2DRowSt ($ar_Array2DF, $sTemp, $rowIndex)
							$i_Check= (($i_Transpose = 0) * ($i_StartColumn)) Or (($i_Transpose) * ($i_StartRow))
							$i_Check = _Iif($i_Check = True, 1, 0)
							_GUICtrlListViewInsertItem($hndListView_Array1Box_Display, $rowIndex, '[' & StringRight('     ' & $rowIndex, 4) & ']|' & $sTemp)
							_GUICtrlListViewDeleteItemsSelected($hndListView_Array1Box_Display)
							$dll = DllOpen("user32.dll")
							$doubleclicked = 1
						EndIf
					EndIf
				Else
					$doubleclicked = 0
				EndIf
				$start = TimerInit()
			EndIf
		EndIf
		Select
			Case $msg[0] = $GUI_EVENT_CLOSE
				ReDim $ar_LISTVIEWArray[4000]
				ReDim $ar_LISTVIEW[4000]
				$AllDone = 1
			Case $msg[0] = $hndButton_Array1Box_Close
				ReDim $ar_LISTVIEWArray[4000]
				ReDim $ar_LISTVIEW[4000]
				$AllDone = 1
			Case $msg[0] = $hndButton_Array1Box_Header
				$i_ZeroRowAsHeader = _Iif($i_ZeroRowAsHeader = 1, 0, 1)
				$i_Transpose = _Iif($i_Transpose = 1, 0, 1)
				_hndButton_Array2Box_Transpose($hndListView_Array1Box_Display, $ar_Array2DF, $sTitle, $i_StartRow, $i_StartColumn, $i_ZeroRowAsHeader, $i_Transpose, $Width, $Height, $Left, $Top, $i_CheckForEmpty, $i_ShowOver4000, $i_Quick)
			Case $msg[0] = $hndButton_Array1Box_ZeroRow
;~ 				redim $ar_LISTVIEWArray[4000]
;~ 				redim $ar_LISTVIEW[4000]
				$i_StartRow = _Iif($i_StartRow = 1, 0, 1)
				If $i_StartRow And Not $i_Transpose Then     ;$i_StartRow=0
					_GUICtrlListViewDeleteItem($hndListView_Array1Box_Display, 0)
				ElseIf $i_StartRow Then 	;$i_StartRow=0
					_GUICtrlListViewHideColumn($hndListView_Array1Box_Display, 1)
				Else 	;really $i_StartRow=1, but here  $i_StartRow=0
					$ar_SingleArray = _Array2DToDau3 ($ar_Array2DF, $sTitle, 0, 0 , ($i_Transpose = 0))
					$i_Check= ($i_Transpose = 1) * ($i_StartRow = 1); rem these are around wrong way
					$i_Check = _Iif($i_Check = True, 1, 0)
					$sTemp = _ArrayToString($ar_SingleArray, "|", $i_Check)
					If $i_Transpose = 0 Then _GUICtrlListViewInsertItem($hndListView_Array1Box_Display, 0, '[' & StringRight('     ' & 0, 4) & ']|' & $sTemp)
					If $i_Check = 0 Then
						_GUICtrlListViewSetColumnWidth($hndListView_Array1Box_Display, 1, $LVSCW_AUTOSIZE);$LVSCW_AUTOSIZE
					EndIf
				EndIf
			Case $msg[0] = $hndButton_Array1Box_ZeroColumn
				ReDim $ar_LISTVIEWArray[4000]
				ReDim $ar_LISTVIEW[4000]
;~ 				$i_StartColumn = _Iif($i_StartColumn = 1, 0, 1)
				If $i_StartColumn And $i_Transpose Then
					_GUICtrlListViewDeleteItem($hndListView_Array1Box_Display, 0)
				ElseIf $i_StartColumn Then
					_GUICtrlListViewHideColumn($hndListView_Array1Box_Display, 1)
				Else
					$ar_SingleArray = _Array2DToDau3 ($ar_Array2DF, $sTitle, 0, 0 , ($i_Transpose = 0))
					$i_Check= ($i_Transpose = 1) * ($i_StartColumn = 1); rem these are around wrong way
					$i_Check = _Iif($i_Check = True, 1, 0)
					$sTemp = _ArrayToString($ar_SingleArray, "|", $i_Check)
					If $i_Transpose = 1 Then _GUICtrlListViewInsertItem($hndListView_Array1Box_Display, 0, '[' & StringRight('     ' & 0, 4) & ']|' & $sTemp)
					If $i_Check = 0 Then
						_GUICtrlListViewSetColumnWidth($hndListView_Array1Box_Display, 1, $LVSCW_AUTOSIZE);$LVSCW_AUTOSIZE
					EndIf
				EndIf
			Case $msg[0] = $hndButton_Array1Box_Transpose
				_hndButton_Array2Box_Transpose($hndListView_Array1Box_Display, $ar_Array2DF, $sTitle, $i_StartRow, $i_StartColumn, $i_ZeroRowAsHeader, $i_Transpose, $Width, $Height, $Left, $Top, $i_CheckForEmpty, $i_ShowOver4000, $i_Quick)
			Case $msg[0] = $hndButton_Array1Box_TextSelect
				$sTxtFile = @ScriptDir & "\ListView.txt"
				Local $a_indices = _GUICtrlListViewGetSelectedIndices($hndListView_Array1Box_Display, 1)
				If (IsArray($a_indices)) Then
					Local $i
					$f = FileOpen($sTxtFile, 2)
					For $i = 1 To $a_indices[0]
						$ExcelLine = StringReplace(_GUICtrlListViewGetItemText($hndListView_Array1Box_Display, $a_indices[$i]), "|", @TAB)
						FileWriteLine($f, $ExcelLine)
					Next
					FileClose($f);
				EndIf
				RunWait("Notepad.exe " & $sTxtFile)
			Case $msg[0] = $hndListView_Array1Box_Display
				$i_OrderNumber = GUICtrlGetState($hndListView_Array1Box_Display) ;Sort the list by the column header clicking
				GUISetState(@SW_LOCK)
				__GUICtrlListViewSort ($hndListView_Array1Box_Display, $B_DESCENDING, GUICtrlGetState($hndListView_Array1Box_Display), 1, $i_CheckForEmpty)
				GUISetState(@SW_UNLOCK)
;~ 				GUISetState(@SW_LOCK)
;~ 				__GUICtrlListViewSort ($hndListView_Array1Box_Display, $B_DESCENDING, GUICtrlGetState($hndListView_Array1Box_Display), 1, $i_CheckForEmpty)
;~ 				GUISetState(@SW_UNLOCK)
		EndSelect
		DllClose($dll)
	Until $AllDone
	;Destroy GUI, Return index of selected item
	$i = ControlListView(WinGetTitle($sTitle), '', $hndListView_Array1Box_Display, "GetSelected")
	If $i = '' Then $i = -1
	ReDim $ar_LISTVIEWArray[1]
	ReDim $ar_LISTVIEW[1]
	ReDim $ar_LISTVIEWArray[4000]
	ReDim $ar_LISTVIEW[4000]
	$i_LISTVIEWNumItemsView = 0
	GUIDelete($hndForm_Array1Box_Main)
	Return $i
EndFunc   ;==>_ArrayViewTextGUI