; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

; This script has a special filename and path because it is automatically
; launched when you run the program directly.  Also, any text file whose
; name ends in .ahk is associated with the program, which means that it
; can be launched simply by double-clicking it.  You can have as many .ahk
; files as you want, located in any folder.  You can also run more than
; one .ahk file simultaneously and each will get its own tray icon.

; SAMPLE HOTKEYS: Below are two sample hotkeys.  The first is Win+Z and it
; launches a web site in the default browser.  The second is Control+Alt+N
; and it launches a new Notepad window (or activates an existing one).  To
; try out these hotkeys, run AutoHotkey again, which will load this file.

; Note: From now on whenever you run AutoHotkey directly, this script
; will be loaded.  So feel free to customize it to suit your needs.

; Please read the QUICK-START TUTORIAL near the top of the help file.
; It explains how to perform common automation tasks such as sending
; keystrokes and mouse clicks.  It also explains more about hotkeys.

^!t::
Run "C:\Program Files\ConEmu\conemu64.exe"
return

#WheelUp::Volume_Up
#WheelDown::Volume_Down
#MButton::Volume_Mute

;Windows + alt + g: run a google search
#!g::
	clipboard =
	Send, ^c
	Sleep 50
	Run, http://www.google.com/search?q=%clipboard%
    	Return

;Windows + alt + a: run a google maps search
#!m::
	clipboard =
	Send, ^c
	Sleep 50
	Run, https://www.google.ch/maps/place/%clipboard%
	Return

;Windows + alt + a: run an amazon search
#!a::
	clipboard =
	Send, ^c
	Sleep 50
	Run, http://www.amazon.es/s/ref=nb_sb_noss_1?field-keywords=%clipboard%
	Return

; alt + F1: merge master onto current branch
^!F1::
	SendInput, git fetch origin master && git merge FETCH_HEAD;
	Return

; start local jetty
^!F2::
	SendInput, set MAVEN_OPTS=-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=8000 -Djetty.port=9090 -XX:MaxPermSize=1024m -XX:PermSize=1024m {Enter}
	SendInput, mvn   -Dlocalds -P jetty -Djetty.port=9090 jetty:run {Enter}
	Return

; mvn install skipping test
^!F3::
	SendInput, mvn install -DskipTests {Enter};
	Return

; mvn bump version
^!F4::
	SendInput, mvn -U org.codehaus.mojo:versions-maven-plugin:1.1:set -DnewVersion=
	Return
