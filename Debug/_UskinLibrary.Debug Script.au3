AutoIt_Debugger_LoadFile("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3")
AutoIt_Debugger_DebugFile(@ScriptFullPath)

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 1, False))
#include-once
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 1, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 2, False))
#Include "H:\autoit_3_3_12\user_include\Debug\_USkinDLL.Debug Script.au3"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 2, False, @error, @extended))
; #INDEX# =======================================================================================================================
; Title ...........: _USkinLibrary.au3
; AutoIt Version ..: 3.2.3++
; Language ........: English
; Description .....: Inter Script communication.
; Author ..........: Jo�o Carlos (Jscript FROM Brazil)
; Collaboration....:
; Link ............:
; Modified by .....:
; About DLL .......: This file is a part of the NEEMedia USkin class library.
; 					2005-2006 Never-Ending Media Technology Ltd,co., All Rights Reserved.
;					Refer to language C -> THIS FILE IS THE PROPERTY OF NEEMEDIA AND IS NOT TO BE
;										RE-DISTRIBUTED BY ANY MEANS WHATSOEVER WITHOUT THE EXPRESSED WRITTEN CONSENT OF NEEMEDIA.
;
;					THIS CODE CAN ONLY BE USED UNDER THE TERMS AND CONDITIONS OUTLINED
;					IN THE USKIN PRO LICENSE AGREEMENT. NEEMEDIA GRANTS TO YOU (ONE SOFTWARE DEVELOPER)
;					THE LIMITED RIGHT TO USE THIS SOFTWARE ON A SINGLE COMPUTER.
;
; 					CONTACT INFORMATION:
;					support@neemedia.com
;					http://www.neemedia.com
; ===============================================================================================================================

; #VARIABLES# ===================================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 27, False))
Global $hUSkinDLLHandle = -1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 27, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))
;================================================================================================================================

; #CURRENT# =====================================================================================================================
; _USkin_LoadDLL
; _USkin_Exit
; _USkin_Init
; _USkin_LoadSkin
; _USkin_RemoveSkin
; _USkin_RestoreSkin
; _USkin_AboutSkin
; ===============================================================================================================================

; #INTERNAL_USE_ONLY#============================================================================================================
;================================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name ..........: _USkin_LoadDLL
; Description ...: Only loads USkin.dll file in memory.
; Syntax ........: _USkin_LoadDLL(  )
; Parameters ....: None
; Return values .: Success 		- Returns 1
;				   Failure		- Returns 0
; Author(s) .....: Jo�o Carlos (Jscript FROM Brazil)
; Modified ......:
; Remarks .......:
; Related .......: _USkin_Exit, _USkin_Init
; Link ..........:
; Example .......: _USkin_LoadDLL()
; ===============================================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 57, False))
Func _USkin_LoadDLL()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 57, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 58, False))
	Local $sDllName
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 58, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sDllName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sDllName", $sDllName))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 60, False))
	$sDllName = _USkinDLL(True)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 60, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sDllName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sDllName", $sDllName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 61, False))
	If @error Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 61, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 63, False))
	$hUSkinDLLHandle = DllOpen($sDllName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 63, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))
If SetError(@error, @extended, IsDeclared("sDllName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sDllName", $sDllName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 64, False))
	If $hUSkinDLLHandle = -1 Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 64, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 66, False))
	DllCall("kernel32.dll", "handle", "LoadLibraryW", "wstr", $sDllName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 66, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sDllName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sDllName", $sDllName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 67, False))
	If @error Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 67, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 69, False))
	Return 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 69, False, @error, @extended))
EndFunc   ;==>_USkin_LoadDLL

; #FUNCTION# ====================================================================================================================
; Name ..........: _USkin_Exit
; Description ...: Exit USkin library and free dll memory.
; Syntax ........: _USkin_Exit(  )
; Parameters ....: None
; Return values .: Success 		- Returns 1
;				   Failure		- Returns 0
; Author(s) .....: Jo�o Carlos (Jscript FROM Brazil)
; Modified ......:
; Remarks .......:
; Related .......: _USkin_LoadDLL
; Link ..........:
; Example .......: _USkin_Exit()
; ===============================================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 86, False))
Func _USkin_Exit()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 86, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 87, False))
	If $hUSkinDLLHandle = -1 Then Return 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 87, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 89, False))
	DllCall($hUSkinDLLHandle, "int", "USkinExit")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 89, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 90, False))
	If @error Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 90, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 92, False))
	Return 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 92, False, @error, @extended))
EndFunc   ;==>_USkin_Exit

; #FUNCTION# ====================================================================================================================
; Name ..........: _USkin_Init
; Description ...: Init USkin library and load skin file.
; Syntax ........: _USkin_Init( $sSkinName [, $sUserName [, $sRegCode ]] )
; Parameters ....: $sSkinName           - A string value of full path skin file.
;                  $sUserName          - [optional] A string value. Only if you is a register member of NEEMedia.
;                  $sRegCode           - [optional] A string value. Only if you is a register member of NEEMedia.
; Return values .: Success 		- Returns 1
;				   Failure		- Returns 0
; Author(s) .....: Jo�o Carlos (Jscript FROM Brazil)
; Modified ......:
; Remarks .......:
; Related .......: _USkin_LoadDLL
; Link ..........:
; Example .......: _USkin_Init($TempOriginalFileBeingDebuggedFileFolder & "\Skins\MySkin.msstyles")
; ===============================================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 111, False))
Func _USkin_Init($sSkinName, $sUserName = "", $sRegCode = "")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 111, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sSkinName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSkinName", $sSkinName))
If SetError(@error, @extended, IsDeclared("sUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sUserName", $sUserName))
If SetError(@error, @extended, IsDeclared("sRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sRegCode", $sRegCode))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 112, False))
	Local $vUserName = "ptr", $vRegCode = "ptr"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 112, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("vUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$vUserName", $vUserName))
If SetError(@error, @extended, IsDeclared("vRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$vRegCode", $vRegCode))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 114, False))
	If $hUSkinDLLHandle = -1 And Not _USkin_LoadDLL() Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 114, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 116, False))
	If StringLen($sUserName) Then $vUserName = "str"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 116, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sUserName", $sUserName))
If SetError(@error, @extended, IsDeclared("vUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$vUserName", $vUserName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 117, False))
	If StringLen($sRegCode) Then $vRegCode = "str"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 117, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sRegCode", $sRegCode))
If SetError(@error, @extended, IsDeclared("vRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$vRegCode", $vRegCode))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 118, False))
	DllCall($hUSkinDLLHandle, "int", "USkinInit", $vUserName, $sUserName, $vRegCode, $sRegCode, "str", $sSkinName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 118, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))
If SetError(@error, @extended, IsDeclared("vUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$vUserName", $vUserName))
If SetError(@error, @extended, IsDeclared("sUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sUserName", $sUserName))
If SetError(@error, @extended, IsDeclared("vRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$vRegCode", $vRegCode))
If SetError(@error, @extended, IsDeclared("sRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sRegCode", $sRegCode))
If SetError(@error, @extended, IsDeclared("sSkinName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSkinName", $sSkinName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 119, False))
	If @error Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 119, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 121, False))
	Return 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 121, False, @error, @extended))
EndFunc   ;==>_USkin_Init

; #FUNCTION# ====================================================================================================================
; Name ..........: _USkin_LoadSkin
; Description ...: Load skin from file.
; Syntax ........: _USkin_LoadSkin( $sSkinName  )
; Parameters ....: $sSkinName           - A string value.
; Return values .: Success 		- Returns 1
;				   Failure		- Returns 0
; Author(s) .....: Jo�o Carlos (Jscript FROM Brazil)
; Modified ......:
; Remarks .......:
; Related .......: _USkin_LoadDLL, _USkin_Init, _USkin_Exit
; Link ..........:
; Example .......: _USkin_LoadSkin($TempOriginalFileBeingDebuggedFileFolder & "\Skins\MySkin.msstyles")
; ===============================================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 138, False))
Func _USkin_LoadSkin($sSkinName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 138, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("sSkinName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSkinName", $sSkinName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 139, False))
	If $hUSkinDLLHandle = -1 Then Return 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 139, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 141, False))
	DllCall($hUSkinDLLHandle, "int", "USkinLoadSkin", "str", $sSkinName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 141, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))
If SetError(@error, @extended, IsDeclared("sSkinName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$sSkinName", $sSkinName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 142, False))
	If @error Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 142, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 144, False))
	Return 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 144, False, @error, @extended))
EndFunc   ;==>_USkin_LoadSkin

; #FUNCTION# ====================================================================================================================
; Name ..........: _USkin_RemoveSkin
; Description ...: Temporary remove Skin style.
; Syntax ........: _USkin_RemoveSkin(  )
; Parameters ....: None
; Return values .: Success 		- Returns 1
;				   Failure		- Returns 0
; Author(s) .....: Jo�o Carlos (Jscript FROM Brazil)
; Modified ......:
; Remarks .......: This function pause uskin, changing the interface look and feel into windows default look.
; Related .......: _USkin_RestoreSkin
; Link ..........:
; Example .......: _USkin_RemoveSkin()
; ===============================================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 161, False))
Func _USkin_RemoveSkin()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 161, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 162, False))
	If $hUSkinDLLHandle = -1 Then Return SetError(1, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 162, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 164, False))
	DllCall($hUSkinDLLHandle, "int", "USkinRemoveSkin")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 164, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 165, False))
	If @error Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 165, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 167, False))
	Return 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 167, False, @error, @extended))
EndFunc   ;==>_USkin_RemoveSkin

; #FUNCTION# ====================================================================================================================
; Name ..........: _USkin_RestoreSkin
; Description ...: Use after _USkin_RemoveSkin() function to restore interface to uskin look and feel.
; Syntax ........: _USkin_RestoreSkin(  )
; Parameters ....: None
; Return values .: Success 		- Returns 1
;				   Failure		- Returns 0
; Author(s) .....: Jo�o Carlos (Jscript FROM Brazil)
; Modified ......:
; Remarks .......:
; Related .......: _USkin_RemoveSkin
; Link ..........:
; Example .......: _USkin_RestoreSkin()
; ===============================================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 184, False))
Func _USkin_RestoreSkin()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 184, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 185, False))
	If $hUSkinDLLHandle = -1 Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 185, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 187, False))
	DllCall($hUSkinDLLHandle, "int", "USkinRestoreSkin")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 187, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 188, False))
	If @error Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 188, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 190, False))
	Return 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 190, False, @error, @extended))
EndFunc   ;==>_USkin_RestoreSkin

; #FUNCTION# ====================================================================================================================
; Name ..........: _USkin_AboutSkin
; Description ...: Informations about NEEMedia.
; Syntax ........: _USkin_AboutSkin(  )
; Parameters ....: None
; Return values .: Success 		- Returns 1
;				   Failure		- Returns 0
; Author(s) .....: Jo�o Carlos (Jscript FROM Brazil)
; Modified ......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......: No
; ===============================================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 207, False))
Func _USkin_AboutSkin()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 207, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 208, False))
	If $hUSkinDLLHandle = -1 Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 208, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 210, False))
	Local $result = DllCall($hUSkinDLLHandle, "int", "USkinAboutSkin")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 210, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("hUSkinDLLHandle")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hUSkinDLLHandle", $hUSkinDLLHandle))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 211, False))
	If @error Then Return SetError(0, 0, 0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 211, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 212, False))
	Return 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\_UskinLibrary.au3", "_UskinLibrary.au3", 212, False, @error, @extended))
EndFunc   ;==>_USkin_AboutSkin
