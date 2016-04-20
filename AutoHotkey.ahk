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
;#KeyHistory
;#InstallKeybdHook


; my path
notePath = c:\sync\notes\
workspace = c:\Users\alex.song\workspace\nfc\NfcAppEMV\jni\
workspaceMs =c:\work\MP\MasterCard\sdkNative\jni\
workspaceMsMerge =c:\work\MP\MasterCard\Merge\mcbp-android\jni\
home = c:\cygwin\home\alex.song\

; local vars
gvim = cmd /c start /max C:\Vim\vim74\gvim.exe
; used files
;%notePath%tickets.txt %notePath%\devNotes\EMV_notes.txt 
;%notePath%gVimNote.txt c:\cygwin\home\alex.song\vimfiles\vimrc C:\Users\alex.song\Documents\AutoHotkey.ahk 
editFiles = %notePath%DailyLog_2016.txt 

sourceFiles = %workspace%apdu.cpp %workspace%apdu.h %workspace%authProtocol.cpp %workspace%authProtocol.h %workspace%mpAgent-jni.c %workspace%../protocol.txt
sourceFilesMs = %workspaceMs%Android.mk %workspaceMs%src\iac\sc.cpp %workspaceMs%src\iac\sc.h %workspaceMs%src/wrappers/android_wrapper.cpp %workspaceMs%src/wrappers/android_wrapper.h %workspaceMs%src/iac/LdeNative.h
sourceFilesMsMerge = %workspaceMsMerge%Android.mk %workspaceMsMerge%databaseTest/databaseTest.cpp %workspaceMsMerge%src\utils\crypto_factory.cpp %workspaceMsMerge%src\core\mcm\mcm_lite_services.cpp %workspaceMsMerge%src\mcbp\dataBase\MCBPDataBaseImpl.cpp %workspaceMsMerge%src\mcbp\dataBase\MCBPDataBaseImpl.h  %workspaceMsMerge%src/wrappers/android_wrapper.cpp %workspaceMsMerge%src/wrappers/android_wrapper.h %workspaceMsMerge%src\mcbp\dataBase\LdeNative.h 

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

SC07B & 4::Run %gvim% -p %sourceFilesMs% -c "cd %workspaceMs%"

SC07B & 5::Run %gvim% -p %sourceFilesMsMerge% -c "cd %workspaceMsMerge%"
 
^4::
IfWinActive CTerm
	WinMinimize
else
IfWinExist CTerm
	WinActivate
else
^Numpad4::Run "C:\tools\cterm-3.6.3\CTerm\CTerm.exe"
;^Numpad4::Run %gvim% -p %sourceFiles% -c "cd %workspace%"
return

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
;Run "C:\Program Files (x86)\Tencent\QQIntl\Bin\QQ.exe"
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

SC07B & s::Send {Down}
SC07B & w::Send {Up}
SC07B & a::Send {Left}
SC07B & d::Send {Right}

; win key supports to max/min the window
#k::#Up
#j::#Down
#h::#Left
;<#l::#Right	;conflict with lock win
<#.::#Right	;conflict with lock win

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
;>^Ins::
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

; use the 07D
SC07D::Send {$}

; use Pause to alt + F4
Pause::Send !{F4}


; reuse the right Fn to Win
;SC079::Send {RWin}
SC079 & Left::Send #{Left}
SC079 & Right::Send #{Right}
SC079 & Up::Send #{Up}
SC079 & Down::Send #{Down}

; switch tabs
#IfWinActive ahk_class MozillaWindowClass
{
   ^p::Send ^{PgUp}
   ^n::Send ^{PgDn}
}
