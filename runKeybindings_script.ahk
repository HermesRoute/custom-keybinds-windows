#Requires AutoHotkey v2.0
#SingleInstance Force

;This runs the keyboard_scripts.ahk if the running of the script is interferred with by
;an admin window. Use right_ctrl+enter to re-run keyboard_scripts.ahk

;add shortcut to "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"

RCtrl & Enter::run("<absolute path to keybindings_script.ahk>")