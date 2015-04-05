;==================================================================================================
; ISN Debug
;==================================================================================================

$console_GUI = GUICreate("ISN AutoIt Studio - Debug Console",860,368,-1,-1,$WS_CAPTION+$WS_POPUP,$WS_EX_TOPMOST)
WinSetTrans($console_GUI,"",200)
GUISetOnEvent ($GUI_EVENT_PRIMARYDOWN, "_Console_focus" ,$console_GUI )
GUISetBkColor(0x000000,$console_GUI)
Global $console_chatbox =_ChatBoxCreate($console_GUI, "", 0, 0, 860,349, 0x000000, true)
;~ Global $console_chatbox =GUICtrlCreateInput("",0,349,860,20,-1,512)
Global $console_commandinput = GUICtrlCreateInput("",0,349,860,20,-1,512)
if $SHOW_DEBUG_CONSOLE = "true" then GUISetState(@SW_SHOW,$console_GUI)



func _Write_ISN_Debug_Console($String,$level=2,$break=1,$notime=0,$notitle=0)
if $SHOW_DEBUG_CONSOLE <> "true" then return
if $break = 1 Then
$br = @CRLF
Else
$br = ""
EndIf

if $notime = 1 Then
$time = ""
Else
$time = @hour&":"&@MIN&":"&@SEC&"  "
EndIf


if $notitle = 1 Then
$title = ""
Else
$title = ""
if $level = 1 then 	$title = "<INFO>      "
if $level = 2 then 	$title = "<WARNING>   "
if $level = 3 then 	$title = "<CRITICAL>  "
EndIf

$str = ""
if $level = 0 then
$str = "[c=#FFFFFF]" &$String & "[/c] "&$br
EndIf

if $level = 1 then
$str = "[c=#00FF00]" &$title&$time&$String & "[/c] "&$br
EndIf

if $level = 2 then
$str = "[c=#FCFF00]" &$title&$time&$String & "[/c] "&$br
EndIf

if $level = 3 then
$str = "[c=#FF0000]" &$title&$time&$String & "[/c] "&$br
EndIf

_GUICtrlRichEdit_SetFont($console_chatbox , 8, "Fixedsys")
_ChatBoxAdd($console_chatbox, $str)
_SendMessage($console_chatbox, $WM_VSCROLL, $SB_BOTTOM, 0)
EndFunc




func _Send_consolCommand()
$to_exec = guictrlread($console_commandinput)
if $to_exec = "" then return
if stringinstr($to_exec,"print ") Then
$value = StringReplace($to_exec,"print ","")
_Write_ISN_Debug_Console("Value of "&$value&": "&StringReplace(Execute($value),"\","\\"),0)
GUICtrlSetData($console_commandinput,"")
return
EndIf

if $to_exec = "exit" then $to_exec = "_exit()"
if $to_exec = "help" OR $to_exec = "?" then
GUICtrlSetData($console_commandinput,"")
$str = "Aviable commands:"&@crlf& _
"---------------------"&@crlf&@crlf& _
"help"&@tab&@tab&@tab&@tab&@tab&":P"&@crlf& _
"print [VALUE OR FUNCTION]"&@tab&"Prints the content of a $ value or the result of a function"&@crlf& _
"exit"&@tab&@tab&@tab&@tab&@tab&"Exit ISN AutoIt Studio"&@crlf& _
"---------------------"&@crlf&@crlf
_Write_ISN_Debug_Console($str,0)
return
EndIf

Execute($to_exec)
if @error then _Write_ISN_Debug_Console("Command not found!",3,1,1,1)
GUICtrlSetData($console_commandinput,"")
endfunc

func _Console_focus()
ControlFocus ($console_GUI, "",$console_commandinput)
EndFunc