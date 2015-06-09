; # Win (Windows logo key). 
; ! Alt 
; ^ Control 
; + Shift 
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey. See below for details. 
; < Use the left key of the pair. e.g. <!a is the same as !a except that only the left Alt key will trigger it. 
; > Use the right key of the pair. 

; sys vars
; A_ProgramFiles, C:\Program Files (x86)\

;Filco Fn keys	VK  SC
;left fn:		EB  07B
;right fn:		FF  079
;Kana:			FF  070
;right shift fn:C1  073
;back space fn:	FF  07D

; open to trace hotkey, or the code of special keys 
#KeyHistory
#InstallKeybdHook


; my path
notePath = c:\sync\notes\
workspace = c:\Users\alex.song\workspace\nfc\NfcAppEMV\jni\
home = c:\cygwin\home\alex.song\

; local vars
gvim = C:\Vim\vim74\gvim.exe
; used files
;%notePath%tickets.txt %notePath%\devNotes\EMV_notes.txt 
editFiles = %notePath%DailyLog_2015.txt %notePath%gVimNote.txt c:\cygwin\home\alex.song\vimfiles\vimrc C:\Users\alex.song\Documents\AutoHotkey.ahk 

sourceFiles = %workspace%apdu.cpp %workspace%apdu.h %workspace%authProtocol.cpp %workspace%authProtocol.h %workspace%mpAgent-jni.c %workspace%../protocol.txt

firefox = "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"


; number pad area
; ^1:: confict with ditto
SC07B & 1::
^Numpad1::Run %gvim% -p %editFiles% -c "cd %notePath%"

SC07B & 2::
^2::
^Numpad2::Run C:\Users\alex.song\Documents\AutoHotkey.ahk

SC07B & 3::
^3::
^Numpad3::Run C:\Users\alex.song\AppData\Roaming\Baidu\BaiduYun\baiduyun.exe

SC07B & 4::
^4::
^Numpad4::Run %gvim% -p %sourceFiles% -c "cd %workspace%"

^7::
^Numpad5::
Run %firefox% global.bing.com
return

^8::
^Numpad6::Run %firefox% www.google.com

^Numpad7::
Run "C:\totalcmd\TOTALCMD.EXE" 
Run "C:\Users\alex.song\Favorites\Links\Microsoft Outlook 2010.lnk"
Run %gvim% -p %editFiles% -c "cd %notePath%"
Run "C:\Users\alex.song\AppData\Local\Youdao\Dict\Application\YodaoDict.exe"
Run "C:\Program Files (x86)\Tencent\QQIntl\Bin\QQ.exe"
return

^6::
^Numpad8::
;Run %notePath%\buffer\testing.ahk
IfWinActive ahk_class ENMainFrame
	WinMinimize
else
IfWinExist ahk_class ENMainFrame 
	WinActivate
else
	Run "C:\Program Files (x86)\Evernote\Evernote\Evernote.exe"
return

^9::
^Numpad9::Run c:\cygwin\Cygwin.bat


; for vim and win
; remapping the Esc to Caps
CapsLock::Esc
;*Capslock::
;  WinGetClass, classname, A
;  if (classname = "Vim")
;  {
;    SetCapsLockState, Off
;    Send, {ESC}
;  }
;  else
;  {
;    GetKeyState, keystate, CapsLock, T
;    if (keystate = "D")
;      SetCapsLockState, Off
;    else
;      SetCapsLockState, On
;    return
;  }
;return


#`::
IfWinExist Total Commander
	WinActivate
else
	Run "C:\totalcmd\TOTALCMD.EXE"
return


; skip the arrow key
; jkhl, Down Up Left Right
;Filco Japanese layout
; left Fn key to arrows
SC07B & j::Send {Down}
SC07B & k::Send {Up}
SC07B & h::Send {Left}
SC07B & l::Send {Right}

SC07B & d::Send {Down}
SC07B & e::Send {Up}
SC07B & s::Send {Left}
SC07B & f::Send {Right}

; win key supports to max/min the window
#k::#Up
#j::#Down
#h::#Left
;<#l::#Right	;conflict with lock win

; !h/l only send the Alt arrow
<!h::
IfWinActive ahk_class MozillaWindowClass
	Send !{Left}
IfWinActive ahk_class TTOTAL_CMD
	Send !{Left}
else
	Send !h
return

<!l:: 
IfWinActive ahk_class MozillaWindowClass
	Send !{Right}
IfWinActive ahk_class TTOTAL_CMD
	Send !{Right}
else
	Send !l
return

; shift help to select 
+!h::Send +{Left}
^+!h::Send ^+{Left}
+!l::Send +{Right}
^+!l::Send ^+{Right}
; Shift up down
+!j::Send +{Down}
+!k::Send +{Up}

; emulate Ins area
SC07B & u::Send !{F4}
SC07B & m:: Send {Delete}
SC07B & i:: Send {Home}
SC07B & ,:: Send {End}
SC07B & o:: Send {PgUp}
SC07B & .:: Send {PgDn}


; mail, outlook
>^Ins::
SC073::
SetTitleMatchMode 2 
IfWinActive Microsoft Outlook
	WinMinimize
else
IfWinExist Microsoft Outlook
	WinActivate
else
	Send {Launch_Mail}
return

; ! Tab for right hand. no need 
;RCtrl & RShift::AltTab


; no mouse op
; LButton on keyboard
Ins::LButton
; RButton on keyboard
>^AppsKey::RButton


; left Fn key act as the Alt
; only for one tab 
SC07B & Tab::AltTab


; Kana for input switch
SC070::Send ^{Space}


; zoom
SC07B & -::Send ^{WheelDown}
SC07B & =::Send ^{WheelUp}

