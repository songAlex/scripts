; # Win (Windows logo key). 
; ! Alt 
; ^ Control 
; + Shift 
; & An ampersand may be used between any two keys or mouse buttons to combine them into a custom hotkey. See below for details. 
; < Use the left key of the pair. e.g. <!a is the same as !a except that only the left Alt key will trigger it. 
; > Use the right key of the pair. 

; sys vars
; A_ProgramFiles, C:\Program Files (x86)\

#KeyHistory
#InstallKeybdHook
; path
notePath = c:\sync\notes\
workspace = c:\Users\alex.song\workspace\nfc\NfcAppEMV\jni\
home = c:\cygwin\home\alex.song\

;local vars
gvim = C:\Vim\vim74\gvim.exe
; used files
;%notePath%tickets.txt %notePath%\devNotes\EMV_notes.txt 
editFiles = %notePath%DailyLog_2015.txt %notePath%gVimNote.txt c:\cygwin\home\alex.song\vimfiles\vimrc C:\Users\alex.song\Documents\AutoHotkey.ahk 

sourceFiles = %workspace%apdu.cpp %workspace%apdu.h %workspace%authProtocol.cpp %workspace%authProtocol.h %workspace%mpAgent-jni.c %workspace%../protocol.txt

firefox = "C:\Program Files (x86)\Mozilla Firefox\firefox.exe"

; for vim
vimrc = %home%vimConfig\_vimrc
gvimrc = %home%vimConfig\_gvimrc
;gvim = C:\Vim\vim74\gvim.exe -u %vimrc% -U %gvimrc%
gvim = C:\Vim\vim74\gvim.exe 

; number pad area
;^1:: confict with ditto
^Numpad1::Run %gvim% -p %editFiles% -c "cd %notePath%"
^2::
^Numpad2::Run C:\Users\alex.song\Documents\AutoHotkey.ahk

^3::
^Numpad3::Run C:\Users\alex.song\AppData\Roaming\Baidu\BaiduYun\baiduyun.exe

^4::
^Numpad4::Run %gvim% -p %sourceFiles% -c "cd %workspace%"

^5::
^Numpad5::
Run %firefox% global.bing.com
return

^6::
^Numpad6::Run %firefox% www.google.com
; still no use, to be refined

; conflict with the firefox
;^0::
^Numpad7::
Run "C:\totalcmd\TOTALCMD.EXE" 
Run "C:\Users\alex.song\Favorites\Links\Microsoft Outlook 2010.lnk"
Run %gvim% -p %editFiles% -c "cd %notePath%"
return

^8::
^Numpad8::
;Run %notePath%\buffer\testing.ahk
Run "C:\Program Files (x86)\Evernote\Evernote\Evernote.exe"
return

^9::
^Numpad9::Run c:\cygwin\Cygwin.bat


; for vim only
; remapping the Esc to Caps
CapsLock::Esc
; a better way:
;classname = ""
;keystate = ""
;
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

; for home ducky keyboard only
;Ctrl::AppsKey


#`::
; IfWinExist Total Commander (x64) 8.51a - Irdeto Access Technology (Beijing) Co.,Ltd
; here do not have to be full name of the window.
IfWinExist Total Commander
	WinActivate
else
	Run "C:\totalcmd\TOTALCMD.EXE"
return

; keep click
;#d::
;   loop, 200
;   {   click, L, 729, 800
;       Sleep 10
;   }
;Return


; emulate the Filco Mini

; skip the arrow key
;^j::Down
;^k::Up
;^h::Left
;^l::Right
;
;!j::Delete
;;!u::Insert
;!i::Home
;!k::End
;!o::PgUp
;!l::PgDn

;LAlt & j:: Send {Down}
;LAlt & k:: Send {Up}
;LAlt & h:: Send {Left}
;LAlt & l:: Send {Right}
;<!h:: Send {Left}
<!h::
IfWinActive ahk_class MozillaWindowClass
	Send !{Left}
else
	Send {Left}
return

<!l:: 
IfWinActive ahk_class MozillaWindowClass
	Send !{Right}
else
	Send {Right}
return

LAlt & m:: Send {Delete}
;Ins::!F4
<!u::!F4
;LAlt & u:: Send {Insert}
LAlt & i:: Send {Home}
LAlt & ,:: Send {End}
LAlt & o:: Send {PgUp}
LAlt & .:: Send {PgDn}


LAlt & j::
SetTitleMatchMode 2 
IfWinActive Google
;IfWinActive ahk_class MozillaWindowClass
	Send !j
else
	Send {Down}
return
LAlt & k:: 
SetTitleMatchMode 2 
IfWinActive Google
	Send !k
else
	Send {Up}
return

; win key supports to move windows
#k::#Up
#j::#Down
#h::#Left
#.::#Right
;<#l::#Right

; mail
>^Ins::
SetTitleMatchMode 2 
IfWinExist Microsoft Outlook
	WinActivate
else
	Send {Launch_Mail}
return

; LButton on key
>^AppsKey::RButton

; ! Tab for right hand. no need 
;RCtrl & RShift::AltTab

