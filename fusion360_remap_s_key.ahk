;
; AutoHotkey script for Fusion 360, to make spacebar into the S key.
;
; Copyright (C) 2020  Thomas Axelsson
;
; SPDX-License-Identifier: AGPL-3.0-or-later
;
;
; If you get problems with writing space somewhere, you might want to change to using
; Ctrl+Space. Change the line to:
; ^Space::s
;

; Script settings
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#SingleInstance force

; Load tray icon
SplitPath, A_ScriptFullPath,, dir,, name_no_ext
icon_path := dir . "\" . name_no_ext . ".ico"
if FileExist(icon_path) {
    Menu, Tray, Icon, %icon_path%
}

#IfWinActive Autodesk Fusion 360 ahk_class Qt5QWindowIcon ahk_exe Fusion360.exe

Space::s

#IfWinActive
