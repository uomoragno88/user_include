AutoIt_Debugger_LoadFile("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3")
AutoIt_Debugger_DebugFile(@ScriptFullPath)

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 1, False))
#include-once
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 1, False, @error, @extended))
;// This file is a part of the NEEMedia USkin class library.
;// 2005-2006 Never-Ending Media Technology Ltd,co., All Rights Reserved.
;//
;// THIS FILE IS THE PROPERTY OF NEEMEDIA AND IS NOT TO BE
;// RE-DISTRIBUTED BY ANY MEANS WHATSOEVER WITHOUT THE EXPRESSED WRITTEN
;// CONSENT OF NEEMEDIA.
;//
;// THIS CODE CAN ONLY BE USED UNDER THE TERMS AND CONDITIONS OUTLINED
;// IN THE USKIN PRO LICENSE AGREEMENT. NEEMEDIA GRANTS TO
;// YOU (ONE SOFTWARE DEVELOPER) THE LIMITED RIGHT TO USE THIS SOFTWARE ON A
;// SINGLE COMPUTER.
;//
;// CONTACT INFORMATION:
;// support@neemedia.com
;// http://www.neemedia.com
;//
;/////////////////////////////////////////////////////////////////////////////


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 20, False))
Global $__USkin_UskinDLL = -1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 20, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 22, False))
Func _USkin_LoadDLL($szUSkinDLL = "USkin.dll")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 22, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("szUSkinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szUSkinDLL", $szUSkinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 23, False))
	$__USkin_UskinDLL = DllOpen($szUSkinDLL)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 23, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))
If SetError(@error, @extended, IsDeclared("szUSkinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szUSkinDLL", $szUSkinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 24, False))
	If $__USkin_UskinDLL<0 Then Return SetError($__USkin_UskinDLL<0,0,False)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 24, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 25, False))
	DllCall("kernel32.dll", "handle", "LoadLibraryW", "wstr", $szUSkinDLL)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 25, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("szUSkinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szUSkinDLL", $szUSkinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 26, False))
	Return True
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 26, False, @error, @extended))
EndFunc

#cs ----------------------------------------------------------------------------
Function Name	:USkinInit
Description		:Init uskin lib and load skin file.
ProtoType		:
	BOOL USkinInit(  LPCTSTR lpszUserName    // user name
	  LPCTSTR lpszRegCode     // sn
	  LPCTSTR lpszFileName    // uskin file name
	);
Parameters		:
	lpszFileName
		[in] uskin file name,path like:neemedia.u3,..\neemedia.u3
	lpszUserName
		[in, opt] user name.default is NULL
	lpszRegCode
		[in, opt] correct sn with user name,default is NULL
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero
#ce
;~ USKIN_API BOOL  __stdcall USkinInit(LPCTSTR lpszUserName,LPCTSTR lpszRegCode,LPCTSTR lpszFileName);


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 49, False))
Func _USkin_Init($szFileName , $szUserName = "" , $szRegCode = "")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 49, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("szFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szFileName", $szFileName))
If SetError(@error, @extended, IsDeclared("szUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szUserName", $szUserName))
If SetError(@error, @extended, IsDeclared("szRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szRegCode", $szRegCode))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 50, False))
	If $__USkin_UskinDLL<0 And Not _USkin_LoadDLL() Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 50, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 51, False))
	Local $tpUserName = "ptr", $tpRegCode = "ptr"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 51, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("tpUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$tpUserName", $tpUserName))
If SetError(@error, @extended, IsDeclared("tpRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$tpRegCode", $tpRegCode))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 52, False))
	If StringLen($szUserName) Then $tpUserName = "str"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 52, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("szUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szUserName", $szUserName))
If SetError(@error, @extended, IsDeclared("tpUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$tpUserName", $tpUserName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 53, False))
	If StringLen($szRegCode) Then $tpRegCode = "str"
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 53, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("szRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szRegCode", $szRegCode))
If SetError(@error, @extended, IsDeclared("tpRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$tpRegCode", $tpRegCode))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 55, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinInit", $tpUserName, $szUserName, $tpRegCode, $szRegCode, "str", $szFileName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 55, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))
If SetError(@error, @extended, IsDeclared("tpUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$tpUserName", $tpUserName))
If SetError(@error, @extended, IsDeclared("szUserName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szUserName", $szUserName))
If SetError(@error, @extended, IsDeclared("tpRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$tpRegCode", $tpRegCode))
If SetError(@error, @extended, IsDeclared("szRegCode")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szRegCode", $szRegCode))
If SetError(@error, @extended, IsDeclared("szFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szFileName", $szFileName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 56, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 56, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 57, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 57, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc



#cs ----------------------------------------------------------------------------
Function Name	:USkinExit
Description		:Exit uskin lib.free memory that uskin alloced
ProtoType		:
	BOOL USkinExit(  );
Parameters		:
	none
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce
;~ USKIN_API BOOL  __stdcall USkinExit();

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 73, False))
Func _USkin_Exit()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 73, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 74, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 74, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 76, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinExit")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 76, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 77, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 77, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 78, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 78, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

#cs ----------------------------------------------------------------------------
Function Name	:USkinLoadSkin
Description		:Load skin from file.
ProtoType		:
	BOOL USkinLoadSkin(  LPCTSTR lpszFileName    // USkin file name
	);
Parameters		:
	lpszFileName
		[in] uskin file name��support path like:neemedia.u3,..\neemedia.u3
Return values	:
		If the function succeeds, the return value is nonzero. If the function fails, the return value is zero
#ce
;~ USKIN_API BOOL  __stdcall USkinLoadSkin(LPCTSTR lpszFileName);

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 94, False))
Func _USkin_LoadSkin($szFileName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 94, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("szFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szFileName", $szFileName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 95, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 95, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 97, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinLoadSkin", "str", $szFileName)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 97, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))
If SetError(@error, @extended, IsDeclared("szFileName")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$szFileName", $szFileName))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 98, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 98, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 99, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 99, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

#cs ----------------------------------------------------------------------------
Function Name	:USkinAboutSkin
Description		:Show skin file's copyright information dialog,such as author,author's email,url.
ProtoType		:
	BOOL USkinAboutSkin(  );
Parameters		:
	none
Return values	:
	none
#ce
;~ USKIN_API void	__stdcall USkinAboutSkin();

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 113, False))
Func _USkin_AboutSkin()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 113, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 114, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 114, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 116, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinAboutSkin")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 116, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 117, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 117, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 118, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 118, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetMenu
Description		:retrieves the handle to the menu assigned to the given window
ProtoType		:
	HMENU USkinGetMenu(  HWND hWnd    // handle to the window
	);
Parameters		:
	hWnd
		[in] handle to the window
Return values	:
	The return value is the handle to the menu. If the given window has no menu, the return value is NULL.
#ce
;~ USKIN_API HMENU __stdcall USkinGetMenu(HWND hWnd);

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 134, False))
Func _USkin_GetMenu($hWnd)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 134, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hWnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hWnd", $hWnd))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 135, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 135, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 137, False))
	Local $result = DllCall($__USkin_UskinDLL, "ptr", "USkinGetMenu", "hWnd", $hWnd)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 137, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))
If SetError(@error, @extended, IsDeclared("hWnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hWnd", $hWnd))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 138, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 138, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 139, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 139, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

#cs ----------------------------------------------------------------------------
Function Name	:USkinUpdateMenuBar
Description		:Update window menubar after modify the menu get from USkinGetMenu.
ProtoType		:
	BOOL USkinUpdateMenuBar(  HWND hWnd    // Handle of window
	);
Parameters		:
	hWnd
		[in] handle of window to update menubar
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce
;~ USKIN_API BOOL  __stdcall USkinUpdateMenuBar(HWND hWnd);

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 155, False))
Func _USkin_UpdateMenuBar($hWnd)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 155, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("hWnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hWnd", $hWnd))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 156, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 156, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 158, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinUpdateMenuBar", "hWnd", $hWnd)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 158, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))
If SetError(@error, @extended, IsDeclared("hWnd")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$hWnd", $hWnd))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 159, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 159, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 160, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 160, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

#cs ----------------------------------------------------------------------------
Function Name	:USkinApplyColorTheme
Description		:Apply color theme using hue and saturation.
ProtoType		:
	BOOL USkinApplyColorTheme(  float fHue    // hue
		  float fSaturation     // saturation
	);
Parameters		:
	fHue
		[in] hue.value range :0.0f-360.f
	fSaturation
		[in] saturation.value range:0.0f - 1.0f
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce
;~ USKIN_API BOOL __stdcall USkinApplyColorTheme(float fHue,float fSaturation);

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 179, False))
Func _USkin_ApplyColorTheme($fHue, $fSaturation)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 179, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("fHue")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$fHue", $fHue))
If SetError(@error, @extended, IsDeclared("fSaturation")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$fSaturation", $fSaturation))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 180, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 180, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 182, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinApplyColorTheme", "float", $fHue, "float", $fSaturation)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 182, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))
If SetError(@error, @extended, IsDeclared("fHue")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$fHue", $fHue))
If SetError(@error, @extended, IsDeclared("fSaturation")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$fSaturation", $fSaturation))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 183, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 183, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 184, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 184, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

; Prog@ndy
; same as _USkin_ApplyColorTheme but for a RGB-color

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 189, False))
Func _USkin_ApplyColorThemeRGB($iRGB)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 189, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("iRGB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$iRGB", $iRGB))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 190, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 190, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 191, False))
	Local $HSV = __USkin_RGB2HSV360(Number($iRGB))
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 191, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("HSV")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$HSV", $HSV))
If SetError(@error, @extended, IsDeclared("iRGB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$iRGB", $iRGB))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 192, False))
	If @error Then Return SetError(3,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 192, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 193, False))
	Local $result = _USkin_ApplyColorTheme($HSV[0],$HSV[1])
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 193, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("HSV")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$HSV", $HSV))
If SetError(@error, @extended, IsDeclared("HSV")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$HSV", $HSV))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 194, False))
	Return SetError(@error,0,$result)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 194, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

#cs ----------------------------------------------------------------------------
Function Name	:USkinRemoveSkin
Description		:Pause uskin.unlike USkinExit function,this function not exit uskin lib,just change the interface look and feel into windows default look
ProtoType		:
	BOOL USkinRemoveSkin(  );
Parameters		:
	none
Return values	:
	failed return false,otherwise return true
#ce
;~ USKIN_API BOOL  __stdcall USkinRemoveSkin();

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 208, False))
Func _USkin_RemoveSkin()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 208, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 209, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 209, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 211, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinRemoveSkin")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 211, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 212, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 212, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 213, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 213, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc


#cs ----------------------------------------------------------------------------
Function Name	:USkinRestoreSkin
Description		:After USkinRemoveSkin,call this function to change interface to uskin look and feel.
ProtoType		:
	BOOL USkinRestoreSkin(  );
Parameters		:
	none
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce
;~ USKIN_API BOOL  __stdcall USkinRestoreSkin();

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 228, False))
Func _USkin_RestoreSkin()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 228, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 229, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 229, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 231, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinRestoreSkin")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 231, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 232, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 232, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 233, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 233, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc


; #FUNCTION# ======================================================================================
; Name...........: __USkin_RGB2HSV360
; Description ...: Converts RGB to HSV360
; Syntax.........: _ColorConvertRGBtoHSL($avArray)
; Parameters ....: $avArray - An array containing RGB values in their respective positions
; Return values .: Success - The array containing the HSL values for the inputted RGB values
;                  Failure - 0, sets @error to 1
; Author ........: Ultima
; Modified.......: Prog@ndy
; Remarks .......: See: <a href="http://www.easyrgb.com/math.php?MATH=M18#text18">EasyRGB - Color mathematics and conversion formulas.</a>
; Related .......: _ColorConvertHSLtoRGB
; Link ..........;
; =================================================================================================

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 250, False))
Func __USkin_RGB2HSV360($nColor)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 250, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nColor")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nColor", $nColor))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 251, False))
	Local $nR = BitAND(BitShift($nColor, 16), 0xFF)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 251, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nR")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nR", $nR))
If SetError(@error, @extended, IsDeclared("nColor")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nColor", $nColor))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 252, False))
	Local $nG = BitAND(BitShift($nColor, 8), 0xFF)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 252, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nG")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nG", $nG))
If SetError(@error, @extended, IsDeclared("nColor")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nColor", $nColor))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 253, False))
	Local $nB = BitAND($nColor, 0xFF)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 253, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nB", $nB))
If SetError(@error, @extended, IsDeclared("nColor")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nColor", $nColor))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 255, False))
	Local $nMax = $nR
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 255, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))
If SetError(@error, @extended, IsDeclared("nR")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nR", $nR))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 256, False))
	If $nMax < $nG Then $nMax = $nG
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 256, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))
If SetError(@error, @extended, IsDeclared("nG")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nG", $nG))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))
If SetError(@error, @extended, IsDeclared("nG")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nG", $nG))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 257, False))
	If $nMax < $nB Then $nMax = $nB
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 257, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))
If SetError(@error, @extended, IsDeclared("nB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nB", $nB))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))
If SetError(@error, @extended, IsDeclared("nB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nB", $nB))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 259, False))
	Local $nMin = $nR
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 259, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMin", $nMin))
If SetError(@error, @extended, IsDeclared("nR")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nR", $nR))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 260, False))
	If $nMin > $nG Then $nMin = $nG
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 260, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMin", $nMin))
If SetError(@error, @extended, IsDeclared("nG")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nG", $nG))
If SetError(@error, @extended, IsDeclared("nMin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMin", $nMin))
If SetError(@error, @extended, IsDeclared("nG")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nG", $nG))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 261, False))
	If $nMin > $nB Then $nMin = $nB
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 261, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMin", $nMin))
If SetError(@error, @extended, IsDeclared("nB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nB", $nB))
If SetError(@error, @extended, IsDeclared("nMin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMin", $nMin))
If SetError(@error, @extended, IsDeclared("nB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nB", $nB))



SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 264, False))
	Local $nMinMaxSum = ($nMax + $nMin)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 264, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMinMaxSum")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMinMaxSum", $nMinMaxSum))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))
If SetError(@error, @extended, IsDeclared("nMin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMin", $nMin))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 265, False))
	Local $nMinMaxDiff = ($nMax - $nMin)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 265, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMinMaxDiff")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMinMaxDiff", $nMinMaxDiff))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))
If SetError(@error, @extended, IsDeclared("nMin")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMin", $nMin))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 267, False))
	Local $nH, $nS
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 267, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))
If SetError(@error, @extended, IsDeclared("nS")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nS", $nS))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 269, False))
	If $nMax = 0 Then
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 269, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))
		; Grayscale

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 271, False))
		$nS = 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 271, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nS")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nS", $nS))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 272, False))
		$nH = 0
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 272, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 273, False))
	Else
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 273, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 275, False))
		$nS = $nMinMaxDiff/$nMax
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 275, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nS")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nS", $nS))
If SetError(@error, @extended, IsDeclared("nMinMaxDiff")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMinMaxDiff", $nMinMaxDiff))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))

		; Hue

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 278, False))
		Switch $nMax
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 278, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 279, False))
			Case $nR
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 279, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nR")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nR", $nR))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 280, False))
				$nH = ($nG - $nB) / (6 * $nMinMaxDiff)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 280, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))
If SetError(@error, @extended, IsDeclared("nG")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nG", $nG))
If SetError(@error, @extended, IsDeclared("nB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nB", $nB))
If SetError(@error, @extended, IsDeclared("nMinMaxDiff")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMinMaxDiff", $nMinMaxDiff))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 281, False))
			Case $nG
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 281, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nG")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nG", $nG))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 282, False))
				$nH = ($nB - $nR) / (6 * $nMinMaxDiff) + 1 / 3
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 282, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))
If SetError(@error, @extended, IsDeclared("nB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nB", $nB))
If SetError(@error, @extended, IsDeclared("nR")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nR", $nR))
If SetError(@error, @extended, IsDeclared("nMinMaxDiff")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMinMaxDiff", $nMinMaxDiff))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 283, False))
			Case $nB
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 283, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nB")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nB", $nB))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 284, False))
				$nH = ($nR - $nG) / (6 * $nMinMaxDiff) + 2 / 3
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 284, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))
If SetError(@error, @extended, IsDeclared("nR")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nR", $nR))
If SetError(@error, @extended, IsDeclared("nG")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nG", $nG))
If SetError(@error, @extended, IsDeclared("nMinMaxDiff")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMinMaxDiff", $nMinMaxDiff))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 285, False))
		EndSwitch
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 285, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 286, False))
		If $nH < 0 Then $nH += 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 286, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 287, False))
		If $nH > 1 Then $nH -= 1
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 287, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))




SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 291, False))
	EndIf
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 291, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 293, False))
	Local $avReturn[3] = [$nH*360, $nS, $nMax]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 293, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("avReturn")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$avReturn", $avReturn))
If SetError(@error, @extended, IsDeclared("nH")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nH", $nH))
If SetError(@error, @extended, IsDeclared("nS")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nS", $nS))
If SetError(@error, @extended, IsDeclared("nMax")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$nMax", $nMax))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 294, False))
	Return $avReturn
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 294, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("avReturn")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$avReturn", $avReturn))
EndFunc

;////////////////////////////////////////////////////////////////////////////////
;//-------------------Professional Function List--------------------------------
;//Notes: following function only valide in professional version,
;//       not valide in free version
;//
;////////////////////////////////////////////////////////////////////////////////
#cs
#cs ----------------------------------------------------------------------------
Function Name	:USkinApplyColorThemeByRGB
Description		:Apply color theme using RGB value.
ProtoType		:
	BOOL USkinApplyColorThemeByRGB(  COLORREF clrTheme    // RGB color
	);
Parameters		:
	clrTheme
		[in] RGB color to apply theme
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 316, False))
USKIN_API BOOL __stdcall USkinApplyColorThemeByRGB(COLORREF clrTheme);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 316, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinLoadSkinFromBuffer
Description		:Load uskin from buffer and change the interface look and feel.
ProtoType		:
	BOOL USkinLoadSkinFromBuffer(  byte* lpBuffer    // pointer to uskin data in memory
		  UINT nBufferSize     // memory buffer size
	);
Parameters		:
	lpBuffer
		[in] uskin data pointer,take careful use,must pass valid pointer,can be null
	nBufferSize
		[in] memory buffer size
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 333, False))
USKIN_API BOOL __stdcall USkinLoadSkinFromBuffer(byte* lpBuffer,UINT nBufferSize);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 333, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinLoadSkinFromResource
Description		:Load uskin from resource and change the interface look and feel.
ProtoType		:
	BOOL USkinLoadSkinFromResource(  HMODULE hInstance    // handle of module
		  LPCTSTR lpszResourceName     // resource name
		LPCTSTR lpszResourceType     // resouce type
	);
Parameters		:
	hInstance
		[in] module handle��if hInstance is NULL,will use current module handle as default
	lpszResourceName
		[in] resource name of uskin resource
	lpszResourceType
		[in] resource type
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 353, False))
USKIN_API BOOL __stdcall USkinLoadSkinFromResource(HMODULE hInstance,LPCTSTR lpszResourceName,LPCTSTR lpszResourceType);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 353, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinSetMenuItemImage
Description		:Set menu item image.
ProtoType		:
	BOOL USkinSetMenuItemImage(  HWND hWnd    // The handle to the window
		UINT nMenuID     // menu item ID
		HIMAGELIST hImageList     // The handle to the image list
		UINT nImageIndex     // image index
	);
Parameters		:
	hWnd
		[in] The handle to the window,if null USkinSetMenuItemImage will set image list to global menu
	nMenuID
		[in] ID of menu item
	hImageList
		[in] The handle to the image list,if null not set
	nImageIndex
		[in] image index in image list
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 376, False))
USKIN_API BOOL __stdcall USkinSetMenuItemImage(HWND hWnd,UINT nMenuID,HIMAGELIST hImageList,UINT nImageIndex);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 376, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinSetMenuItemImageEx
Description		:Set menu item image.
ProtoType		:
	BOOL USkinSetMenuItemImageEx(  HWND hWnd    // The handle to the window
		UINT nMenuID     // menu item's ID
		HIMAGELIST hImageList     // image list handle
		UINT nImageIndex     // image index in image list
		HIMAGELIST hImageListHot     // hilighted state image list handle
		UINT nImageIndexHot     // image index in image list
		HIMAGELIST hImageListDisabled     // disabled state image list handle
		UINT nImageIndexDisabled     // image index in image list
	);
Parameters		:
	hWnd
		[in] The handle to the window,if is null the USkinSetMenuItemImageEx will set global menu item image
	nMenuID
		[in] menu item ID
	hImageList
		[in] The handle to the image list ,if is null ,not set
	nImageIndex
		[in] image index in image list
	hImageListHot
		[in] The handle to the hilighted state image list,if null not set
	nImageIndexHot
		[in] image index in image list
	hImageListDisabled
		[in] The handle to the disabeld state imag list, if null not set
	nImageIndexDisabled
		[in] image index in image list
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 411, False))
USKIN_API BOOL __stdcall USkinSetMenuItemImageEx(HWND hWnd,UINT nMenuID,HIMAGELIST hImageList,UINT nImageIndex,HIMAGELIST hImageListHot,UINT nImageIndexHot,HIMAGELIST hImageListDisabled,UINT nImageIndexDisabled);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 411, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 413, False))
typedef HANDLE HUSKIN;
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 413, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinOpenSkinData
Description		:Open custom define skin object data.
ProtoType		:
	HUSKIN USkinOpenSkinData(  LPCTSTR lpszSkinObjectName    // custom define skin object name
	);
Parameters		:
	lpszSkinObjectName
		[in] custom define uskin object name
Return values	:
	If the function succeeds, the return value is handle of uskin object. If the function fails, the return value is NULL
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 427, False))
USKIN_API HUSKIN __stdcall USkinOpenSkinData(LPCTSTR lpszSkinObjectName);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 427, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinCloseSkinData
Description		:Close custom skin data.
ProtoType		:
	BOOL USkinCloseSkinData(  HUSKIN hUSkin    // handle to the uskin object
	);
Parameters		:
	hUSkin
		[in] The handle of uskin object
Return values	:
	If the function succeeds, the return value is a handle to the uskin object. If the function fails, the return value is NULL.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 441, False))
USKIN_API BOOL __stdcall USkinCloseSkinData(HUSKIN hUSkin);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 441, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetBool
Description		:Get custom define skin object bool property value.
ProtoType		:
	BOOL USkinGetBool(  HUSKIN hUSkin    // The handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		BOOL* lpValue    //
	);
Parameters		:
	hUSkin
		[in] The handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpValue
		[out] BOOL vlaue pointer
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 461, False))
USKIN_API BOOL __stdcall USkinGetBool(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,BOOL* lpValue);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 461, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetInt
Description		:Get int property value of uskin object.
ProtoType		:
	BOOL USkinGetInt(  HUSKIN hUSkin    // handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		int* lpValue    //
	);
Parameters		:
	hUSkin
		[in] handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpValue
		[out] int value pointer
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 481, False))
USKIN_API BOOL __stdcall USkinGetInt(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,int* lpValue);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 481, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetDWORD
Description		:Get custom define skin object DWORD property value.
ProtoType		:
	BOOL USkinGetDWORD(  HUSKIN hUSkin    // The handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		DWORD* lpValue    //
	);
Parameters		:
	hUSkin
		[in] The handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpValue
		[out] DWORD value pointer
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 501, False))
USKIN_API BOOL __stdcall USkinGetDWORD(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,DWORD* lpValue);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 501, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetDouble
Description		:Get custom define skin object double property value.
ProtoType		:
	BOOL USkinGetDouble(  HUSKIN hUSkin    // The handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		double* lpValue    //
	);
Parameters		:
	hUSkin
		[in] The handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpValue
		[out] double value pointer
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 521, False))
USKIN_API BOOL __stdcall USkinGetDouble(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,double* lpValue);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 521, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetString
Description		:Get custom define skin object string property value.
ProtoType		:
	BOOL USkinGetString(  HUSKIN hUSkin    // The handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		LPTSTR lpString    // pointer to the string buffer
		UINT nMaxSize    // string buffer max size
	);
Parameters		:
	hUSkin
		[in] The handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpString
		[out] pointer to the string buffer
	nMaxSize
		[in] max size of string buffer
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 544, False))
USKIN_API BOOL __stdcall USkinGetString(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,LPTSTR lpString,UINT nMaxSize);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 544, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetEnumString
Description		:Get custom define skin object enum value name.
ProtoType		:
	BOOL USkinGetEnumString(  HUSKIN hUSkin    // The handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		LPTSTR lpString    // pointer to the string buffer
		UINT nMaxSize    //
	);
Parameters		:
	hUSkin
		[in] The handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpString
		[out] pointer to the buffer
	nMaxSize
		[in] string buffer size
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 567, False))
USKIN_API BOOL __stdcall USkinGetEnumString(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,LPTSTR  lpString,UINT nMaxSize);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 567, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetEnumValue
Description		:Get custom define skin object DWORD property value.
ProtoType		:
	BOOL USkinGetEnumValue(  HUSKIN hUSkin    // The handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		DWORD* lpValue    //
	);
Parameters		:
	hUSkin
		[in] The handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpValue
		[out] DWORD value pointer
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 587, False))
USKIN_API BOOL __stdcall USkinGetEnumValue(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,DWORD* lpValue);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 587, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetFont
Description		:Get custom define skin object font property vaule.
ProtoType		:
	BOOL USkinGetFont(  HUSKIN hUSkin    // The handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		LOGFONT* lpFont    //
	);
Parameters		:
	hUSkin
		[in] The handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpFont
		[out] LOGFONT value pointer
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 607, False))
USKIN_API BOOL __stdcall USkinGetFont(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,LOGFONT* lpLogFont);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 607, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetColor
Description		:Get custom define object color property value.
ProtoType		:
	BOOL USkinGetColor(  HUSKIN hUSkin    // The handle to the uskin object
		LPCTSTR lpszSkinPropName    // property name
		COLORREF* lpColor    //
	);
Parameters		:
	hUSkin
		[in] The handle to the uskin object
	lpszSkinPropName
		[in] property name
	lpColor
		[out] COLORREF value pointer
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 627, False))
USKIN_API BOOL __stdcall USkinGetColor(HUSKIN hUSkin,LPCTSTR lpszSkinPropName,COLORREF* lpColor);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 627, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinDrawSkinImageSection
Description		:Draw special skinimagesection with skinpaintoption on DC.
ProtoType		:
	BOOL USkinDrawSkinImageSection(  HUSKIN hUSkin    // Handle to the USkin object
		LPCTSTR lpszSkinPaintOptionResName    // custom skinpaintoption property name
		LPCTSTR lpszSkinImageSectionResName    // custom skinimagesection property name
		HDC hDC    // handle to the device context
		LPRECT lpDrawRect    // rectangle of skinimagesection to be drawn
	);
Parameters		:
	hUSkin
		[in] The handle of uskin object
	lpszSkinPaintOptionResName
		[in] custom skinpaintoption property name
	lpszSkinImageSectionResName
		[in] custom skinimagesection property name
	hDC
		[in] Handle to the device context
	lpDrawRect
		[in] Pointer to a RECT structure that contains the rectangle (in logical coordinates) in which the property is to be drawn
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 653, False))
USKIN_API BOOL __stdcall USkinDrawSkinImageSection(HUSKIN hUSkin,LPCTSTR lpszSkinPaintOptionResName,LPCTSTR lpszSkinImageSectionResName,HDC hDC,LPRECT lpDrawRect);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 653, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinDrawText
Description		:Draw special textstyle within a rectangle on DC.
ProtoType		:
	BOOL USkinDrawText(  HUSKIN hUSkin    // The handle of USkin object
		LPCTSTR lpszSkinTextStyleResName    // The textstyle property name
		HDC hDC    // handle to the device context
		LPRECT lpTextRect    // text rectangle
		LPCTSTR lpszText    // texted to be drawn,must to a null-terminated string
	);
Parameters		:
	hUSkin
		[in] The handle of USkin object
	lpszSkinTextStyleResName
		[in] The property name. which type must be TEXTEFFECT
	hDC
		[in] Handle to the device context
	lpTextRect
		[in] Pointer to a RECT structure that contains the rectangle (in logical coordinates) in which the text is to be draw
	lpszText
		[in] pointer to the string to be drawn
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 679, False))
USKIN_API BOOL __stdcall USkinDrawText(HUSKIN hUSkin,LPCTSTR lpszSkinTextStyleResName,HDC hDC,LPRECT lpTextRect,LPCTSTR lpszText);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 679, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinSetWindowSkin
Description		:Set windows skin.
ProtoType		:
	BOOL USkinSetWindowSkin(  HWND hWnd    // The handle to the window
		LPCTSTR lpszSkinObjectName    // uskin object name
	);
Parameters		:
	hWnd
		[in] The handle to the window
	lpszSkinObjectName
		[in] uskin object name
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 696, False))
USKIN_API BOOL __stdcall USkinSetWindowSkin(HWND hWnd,LPCTSTR lpszSkinObjectName);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 696, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinEnableWindowSkin
Description		:Enable window support skin.
ProtoType		:
	BOOL USkinEnableWindowSkin(  HWND hWnd    // The handle of window
		BOOL bEnabled    // using uskin
	);
Parameters		:
	hWnd
		[in] The handle of window
	bEnabled
		[in] is window supported uskin
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 713, False))
USKIN_API BOOL __stdcall USkinEnableWindowSkin(HWND hWnd,BOOL bEnabled);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 713, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinApplyThread
Description		:Apply uskin to thread UI.
ProtoType		:
	BOOL USkinApplyThread(  DWORD dwThreadID    // thread id
	);
Parameters		:
	dwThreadID
		[in] thread id
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 727, False))
USKIN_API BOOL __stdcall USkinApplyThread(DWORD dwThreadID);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 727, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetSysColor
Description		:Get uskin define system color.
ProtoType		:
	COLORREF USkinGetSysColor(  int nIndex    // color index
	);
Parameters		:
	nIndex
		[in] Color Index Value Meaning
Return values	:
	If the function succeeds, the return value is RGB color. If the function fails, the return value is 0.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 741, False))
USKIN_API COLORREF __stdcall USkinGetSysColor(int nIndex);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 741, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetSysColorBrush
Description		:Get uskin define system color brush.
ProtoType		:
	HBRUSH USkinGetSysColorBrush(  int nIndex    // index of brush
	);
Parameters		:
	nIndex
		[in] index of brush Value Meaning

Return values	:
	If the function succeeds, the return value is handle to the brush. If the function fails, the return value is NULL.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 756, False))
USKIN_API HBRUSH __stdcall USkinGetSysColorBrush(int nIndex);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 756, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetWinColor
Description		:Get system color.
ProtoType		:
	COLORREF USkinGetWinColor(  int nIndex    // color index
	);
Parameters		:
	nIndex
		[in] color index Value Meaning
Return values	:
	If the function succeeds, the return value is RGB color. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 770, False))
USKIN_API COLORREF __stdcall USkinGetWinColor(int nIndex);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 770, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetWinColorBrush
Description		:Get windows system color brush.
ProtoType		:
	HBRUSH USkinGetWinColorBrush(  int nIndex    // index
	);
Parameters		:
	nIndex
		[in] color brush index Value Meaning

Return values	:
	If the function succeeds, the return value is handle to the brush. If the function fails, the return value is NULL
#ce


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 786, False))
USKIN_API HBRUSH __stdcall USkinGetWinColorBrush(int nIndex);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 786, False, @error, @extended))
#cs ----------------------------------------------------------------------------
Function Name	:USkinDrawFrameControl
Description		:Same as DrawFrameControl, you can see detail in msdn.
ProtoType		:
	BOOL USkinDrawFrameControl(  HDC hDC    // device context
		LPRECT lpRect    // draw rect
		UINT uType    // draw type
		UINT uState    // draw state
	);
Parameters		:
	hDC
		[in] device context
	lpRect
		[in] draw rect
	uType
		[in] draw type
	uState
		[in] draw state
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 808, False))
USKIN_API BOOL	__stdcall USkinDrawFrameControl(HDC hdc,LPRECT lprc,UINT uType,UINT uState);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 808, False, @error, @extended))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 810, False))
//New Functions in v2.2
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 810, False, @error, @extended))
#cs ----------------------------------------------------------------------------
Function Name	:USkinGetWindowSkinObjectText
Description		:Get windows skin object's text property.
ProtoType		:
	BOOL USkinGetWindowSkinObjectText(  HWND hWnd    // Handle of window
		LPCTSTR lpszSkinObjectName    // Skin object name
		LPTSTR lpString    // lpString
		UINT nMaxSize    //
	);
Parameters		:
	hWnd
		[in] Handle of window
	lpszSkinObjectName
		[in] skin object name
	lpString
		[out] string text
	nMaxSize
		[in] max string size
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 832, False))
USKIN_API BOOL __stdcall USkinGetWindowSkinObjectText(HWND hWnd,LPCTSTR lpszSkinObjectName,LPTSTR lpString,UINT nMaxSize);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 832, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinSetWindowSkinObjectText
Description		:Set window skinobject's text property.
ProtoType		:
	BOOL USkinSetWindowSkinObjectText(  HWND hWnd    // handle of window
		LPCTSTR lpszSkinObjectName    // skin object name
		LPTSTR lpString    // text to set
	);
Parameters		:
	hWnd
		[in] handle of window
	lpszSkinObjectName
		[in] skin object name
	lpString
		[in] text to set
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 852, False))
USKIN_API BOOL __stdcall USkinSetWindowSkinObjectText(HWND hWnd,LPCTSTR lpszSkinObjectName,LPCTSTR lpString);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 852, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetWindowSkinObjectRect
Description		:Get window skin object's rect property.
ProtoType		:
	BOOL USkinGetWindowSkinObjectRect(  HWND hWnd    // Handle of window
		LPCTSTR lpszSkinObjectName    // Skin object name
		LPRECT lpRect    //
	);
Parameters		:
	hWnd
		[in] Handle of window
	lpszSkinObjectName
		[in] Skin object name
	lpRect
		[in] RECT value
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 872, False))
USKIN_API BOOL __stdcall USkinGetWindowSkinObjectRect(HWND hWnd,LPCTSTR lpszSkinObjectName,LPRECT lpRect);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 872, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetWindowSkinObjectVisible
Description		:Get window skin object's visible property.
ProtoType		:
	BOOL USkinGetWindowSkinObjectVisible(  HWND hWnd    // Handle of window
		LPCTSTR lpszSkinObjectName    // skin object name
		BOOL* lpbVisible    //
	);
Parameters		:
	hWnd
		[in] handle of window
	lpszSkinObjectName
		[in] skin object name
	lpbVisible
		[out] BOOL* vale to store result
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 892, False))
USKIN_API BOOL _stdcall USkinSetWindowSkinObjectVisible(HWND hWnd,LPCTSTR lpszSkinObjectName,BOOL bVisible);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 892, False, @error, @extended))

#cs ----------------------------------------------------------------------------
Function Name	:USkinSetWindowSkinObjectVisible
Description		:Set skin object's visible property that apply to the window.
ProtoType		:
	BOOL USkinSetWindowSkinObjectVisible(  HWND hWnd    // Handle of window
		LPCTSTR lpszSkinObjectName    // SkinObject name
		BOOL bVisible    //
	);
Parameters		:
	hUSkin
		[in] handle of window
	lpszSkinObjectName
		[in] skinobject name
	bVisible
		[in] set skinobject visible
Return values	:
	If the function succeeds, the return value is nonzero. If the function fails, the return value is zero.
#ce

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 912, False))
USKIN_API BOOL _stdcall USkinGetWindowSkinObjectVisible(HWND hWnd,LPCTSTR lpszSkinObjectName,BOOL& bVisible);
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 912, False, @error, @extended))

#ce

;//Error Support
;~ enum EnumUSkinErrorCode
;~ {
;~ 	ueFunctionNotSupport,
;~ 	ueFunctionError
;~ };

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 922, False))
Global Enum $ueFunctionNotSupport, $ueFunctionError
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 922, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("ueFunctionNotSupport")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ueFunctionNotSupport", $ueFunctionNotSupport))
If SetError(@error, @extended, IsDeclared("ueFunctionError")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$ueFunctionError", $ueFunctionError))

#cs ----------------------------------------------------------------------------
Function Name	:USkinGetLastError
Description		:Get last error code.
ProtoType		:
	BOOL USkinGetLastError(
	);
Parameters		:
	none
Return values	:
	Get the result code
#ce
;~ USKIN_API LONG __stdcall USkinGetLastError();

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 936, False))
Func _USkin_GetLastError()
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 936, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 937, False))
	If $__USkin_UskinDLL<0 Then Return SetError(1,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 937, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))


SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 939, False))
	Local $result = DllCall($__USkin_UskinDLL, "int", "USkinGetLastError")
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 939, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
If SetError(@error, @extended, IsDeclared("__USkin_UskinDLL")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$__USkin_UskinDLL", $__USkin_UskinDLL))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 940, False))
	If @error Then Return SetError(2,0,0)
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 940, False, @error, @extended))

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 941, False))
	Return $result[0]
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 941, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("result")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$result", $result))
EndFunc

#cs -----------------------------------------------------------------------------
Message Name	:WM_USKINCOMMAND
Description		:this message will raised when click window caption button.
ProtoType		:
	WM_USKINCOMMAND      //
		WPARAMwParam    //
		LPARAMlParam    //

Parameters		:
	wParam
		caption button command id
	lParam
		caption button name
Return values	:
	failed return false,otherwise return true
#ce
;~ #ifndef WM_USKINCOMMAND
;~ 	#define WM_USKINCOMMAND	WM_USER+1001

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 962, False))
	Global Const $WM_USKINCOMMAND	= 0x400+1001
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 962, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("WM_USKINCOMMAND")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$WM_USKINCOMMAND", $WM_USKINCOMMAND))
;~ #endif

#cs -----------------------------------------------------------------------------
Message Name	:WM_USKINCHANGED
Description		:this message will send when change uskin file or apply color theme to uskin.
ProtoType		:
	WM_USKINCHANGED      //
		WPARAMwParam    //
		LPARAMlParam    //

Parameters		:
	wParam
		0
	lParam
		0
Return values	:
	failed return false,otherwise return true
#ce
;~ #ifndef WM_USKINCHANGED
;~ 	#define WM_USKINCHANGED WM_USER+1005

SetError(@error, @extended, AutoIt_Debugger_NextLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 983, False))
	Global Const $WM_USKINCHANGED = 0x400+1005
SetError(@error, @extended, AutoIt_Debugger_FinishedLine("H:\autoit_3_3_12\user_include\USkin.au3", "USkin.au3", 983, False, @error, @extended))
If SetError(@error, @extended, IsDeclared("WM_USKINCHANGED")) Then SetError(@error, @extended, AutoIt_Debugger_SendVariable("$WM_USKINCHANGED", $WM_USKINCHANGED))
;~ #endif
