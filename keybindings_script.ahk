#Requires AutoHotkey v2.0
#SingleInstance Force
;add shortcut to "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"

;===============================================
; Disable the hotkey-flood safety limit warning
;===============================================
A_HotkeyInterval := 0

;===============================
; Set CapsLock to AlwaysOff
;===============================
SetCapsLockState "AlwaysOff"

;==========================================================================
; Set NumLockState to Always on for exclusive use of number keys on numpad
;==========================================================================
SetNumLockState "AlwaysOn"

;============================
; Set global Vim keybindings
;============================
LAlt & h::Send("{Left}")
LAlt & j::Send("{Down}")
LAlt & k::Send("{Up}")
LAlt & l::Send("{Right}")

;======================================
; Set global state of magicKey pressed
;======================================
global magicUsed := false

;==========================================================
; When pressing the magicKey, the following keys are sent:
; Left Shift + Left Ctrl + Left Alt + Right Shift
;==========================================================
magicKey := "<+<^<!>+"

;======================================================================================
; Pressing CapsLock triggers the magicKey
; If only the CapsLock key is used then Esc is sent
; If CapsLock is used in combination with any other key then the magicKey is triggered
;======================================================================================
*CapsLock::
{
    global magicUsed := false
    Send "{LShift down}{LCtrl down}{LAlt down}{RShift down}"
}

*CapsLock up::
{
    global magicUsed
    Send "{LShift up}{LCtrl up}{LAlt up}{RShift up}"
    if (!magicUsed)
        Send "{Esc}"
}

;========================
; Magic Key Combinations
;========================
Hotkey magicKey . "Left", MoveVirtualDesktopLeft
Hotkey magicKey . "LButton", MoveVirtualDesktopLeft
Hotkey magicKey . "Right", MoveVirtualDesktopRight
Hotkey magicKey . "RButton", MoveVirtualDesktopRight
Hotkey magicKey . "f", ToggleFullScreen
Hotkey magicKey . "Backspace", CloseWindow
Hotkey magicKey . "3", HashComment
Hotkey magicKey . "=", TreeBranch
Hotkey magicKey . "-", TreeEnd
Hotkey magicKey . "NumpadSub", EmojiSmile
Hotkey magicKey . "NumpadMult", EmojiEyes
Hotkey magicKey . "NumpadDiv", EmojiHands
Hotkey magicKey . "NumLock", EmojiSalute
Hotkey magicKey . "2", SpecialE
Hotkey magicKey . "4", CurrencyEuro
Hotkey magicKey . "Up", VolumeUp
Hotkey magicKey . "WheelUp", VolumeUp
Hotkey magicKey . "Down", VolumeDown
Hotkey magicKey . "WheelDown", VolumeDown
Hotkey magicKey . "m", ToggleMute
Hotkey magicKey . "MButton", ToggleMute
Hotkey magicKey . "Enter", WindowsTerminal
Hotkey magicKey . "c", VisualStudioCode
Hotkey magicKey . "e", FileExplorer
Hotkey magicKey . "n", NotepadPlusPlus
Hotkey magicKey . "1", PasswordManager

;=====================
; Magic Key Functions
;=====================
MoveVirtualDesktopLeft(*)
{
	global magicUsed := true
	Send "{Blind}{LShift up}{LAlt up}{RShift up}{LWin down}{Left}{LWin up}{LShift down}{LAlt down}{RShift down}"
}	

MoveVirtualDesktopRight(*)
{
	global magicUsed := true
	Send "{Blind}{LShift up}{LAlt up}{RShift up}{LWin down}{Right}{LWin up}{LShift down}{LAlt down}{RShift down}"
}

ToggleFullScreen(*)
{
	global magicUsed := true
	Send "{Blind}{LShift up}{LCtrl up}{LAlt up}{RShift up}{F11}{LShift down}{LCtrl down}{LAlt down}{RShift down}"
}

CloseWindow(*)
{
	global magicUsed := true
	Send "{Blind}{LShift up}{LCtrl up}{RShift up}{F4}{LShift down}{LCtrl down}{LAlt down}{RShift down}"
}

HashComment(*)
{
	global magicUsed := true
    SendText "#==========  =========="
}

TreeBranch(*)
{
	global magicUsed := true
	SendText "├──"
}

TreeEnd(*)
{
	global magicUsed := true
	SendText "└──"
}

EmojiSmile(*)
{
	global magicUsed := true
    Send "🙂"
}

EmojiEyes(*)
{
	global magicUsed := true
    Send "👀"
}

EmojiHands(*)
{
	global magicUsed := true
    Send "🙏"
}

EmojiSalute(*)
{
	global magicUsed := true
    Send "🫡"
}

SpecialE(*)
{
	global magicUsed := true
    SendText "é"
}

CurrencyEuro(*)
{
	global magicUsed := true
    SendText "€"
}

VolumeUp(*)
{
	SoundSetVolume("+2")
}

VolumeDown(*)
{
	SoundSetVolume("-2")
}

ToggleMute(*)
{
	global magicUsed := true
    SoundSetMute(-1)
}

WindowsTerminal(*)
{
	global magicUsed := true
	Run("wt.exe")
}

VisualStudioCode(*)
{
	global magicUsed := true
	Run("code.exe")
}

FileExplorer(*)
{
	global magicUsed := true
	Run("explorer.exe")
}

NotepadPlusPlus(*)
{
	global magicUsed := true
	Run("notepad++.exe")
}

PasswordManager(*)
{
	global magicUsed := true
	Run("1Password.exe")
}