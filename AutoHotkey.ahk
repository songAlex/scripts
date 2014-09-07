; # Win (Windows logo key). 
; ! Alt 
; ^ Control 
; + Shift 
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey. See below for details. 
; < Use the left key of the pair. e.g. <!a is the same as !a except that only the left Alt key will trigger it. 
; > Use the right key of the pair. 

notePath = c:\sync\notes\
; vimFiles = %notePath%
vimFiles = "c:\Documents and Settings\songjie\My Documents\AutoHotkey.ahk" %notePath%Daily_log_2014.4.txt C:\cygwin\home\songjie\_gvimrc

; sys vars
; A_ProgramFiles

^Numpad1::Run %A_ProgramFiles%\Vim\vim74\gvim.exe  -p %vimFiles%
^Numpad2::Run c:\Documents and Settings\songjie\My Documents\AutoHotkey.ahk
^Numpad3::Run "C:\Program Files\Baidu\BaiduYun\baiduyun.exe"
^Numpad4::Run calc
^Numpad5::Run www.baidu.com
^Numpad6::Run www.google.com
;^Numpad6::Run www.google.com


#1:: Run "C:\Program Files\Notepad++\notepad++.exe"

; only open the first vim window
#2:: 
IfWinExist ahk_class Vim
	WinActivate
else
	Run "C:\Program Files\Vim\vim74\gvim.exe" -p vimFiles
return

#3:: Run "C:\Program Files\Mozilla Firefox\firefox.exe"

#`::
IfWinExist Total Commander
	WinActivate
else
	Run "C:\Program Files\totalcmd\TOTALCMD.EXE"
return


CapsLock::Esc
RCtrl::AppsKey
;Esc::CapsLock

;testing area
#Up::
WinGet, active_id, ID, A
WinMaximize, ahk_id %active_id%
;MsgBox, The active window's ID is "%active_id%".
return

#Down::
WinGet, active_id, ID, A
WinRestore, ahk_id %active_id%
;MsgBox, The active window's ID is "%active_id%".
return

F4::
IfWinActive ahk_class MozillaWindowClass
{
MouseGetPos, xpos, ypos 
click 741,759
MouseMove, %xpos%, %ypos%
return
}
F4::F4
return

F2::
IfWinActive ahk_class MozillaWindowClass
{
MouseGetPos, xpos, ypos 
click 425,761
MouseMove, %xpos%, %ypos%
return
}
F2::F2
return

F3::
IfWinActive ahk_class MozillaWindowClass
{
MouseGetPos, xpos, ypos 
click 639,759
MouseMove, %xpos%, %ypos%
return
}
F3::F3
return 
