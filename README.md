# Windows Custom Keybinds

A custom AutoHotkey v2 script that turns **CapsLock** into a "Magic Key" (Hyper Key) — a leader key for launching apps, inserting text snippets, and controlling windows, while still working as a normal Escape key when tapped alone. This takes the CapsLock key from being a useless key I never use and accidentally press and makes it the most useful key on my keyboard.

## Requirements

- [AutoHotkey v2.0](https://www.autohotkey.com/) installed
- Windows 11

## Installation

1. Save the script as a `.ahk` file (e.g. `keybindings_script.ahk`)
2. To run it automatically on login, place a shortcut to it in:
   `%appdata%\Microsoft\Windows\Start Menu\Programs\Startup`
3. Double-click the file to run it manually, or right-click → **Run Script**

## How the Magic Key Works

- **Tap CapsLock alone** -> sends `Escape`
- **Hold CapsLock + another key** -> triggers the corresponding Magic Key combo below

Internally, holding CapsLock virtually holds down **Left Shift + Left Ctrl + Left Alt + Right Shift**. Every combo below is really "that 4-modifier combination + [key]" under the hood — but you never need to think about it that way day-to-day. I chose this combination as it is one that I would never accidentally use.

CapsLock's native toggle behavior is disabled (`SetCapsLockState "AlwaysOff"`), so it never gets stuck on.

## Magic Key Combos

| Combo | Action |
|---|---|
| Magic + `Left` / `LButton` | Move to virtual desktop on the left |
| Magic + `Right` / `RButton` | Move to virtual desktop on the right |
| Magic + `f` | Toggle fullscreen |
| Magic + `Backspace` | Close active window |
| Magic + `c` | Insert comment block |
| Magic + `=` | Insert tree branch (`├──`) |
| Magic + `-` | Insert tree end (`└──`) |
| Magic + `NumpadSub` | 🙂 |
| Magic + `NumpadMult` | 👀 |
| Magic + `NumpadDiv` | 🙏 |
| Magic + `NumLock` | 🫡 |
| Magic + `2` | Special E snippet |
| Magic + `4` | € currency symbol |
| Magic + `Up` / `WheelUp` | Volume up |
| Magic + `Down` / `WheelDown` | Volume down |
| Magic + `m` / `MButton` | Toggle mute |
| Magic + `Enter` | Open Windows Terminal |
| Magic + `c` | Open VS Code |
| Magic + `e` | Open File Explorer |
| Magic + `n` | Open Notepad++ |
| Magic + `1` | Open Password Manager |

## Other Remaps (outside the Magic Key)

| Hotkey | Action |
|---|---|
| `CapsLock` (tap) | Escape |
| `LAlt + h/j/k/l` | Arrow keys (Vim-style navigation) |

## Additional

The script runs at the user level which means if any window is opened as admin, the script won't function on that window. This also introduces the possibility of the magic key breaking as if CapsLock is accidentally pressed while the admin window is active, then CapsLock can get stuck in the "on" state. Included in the project is runKeybindings_script.ahk.
This is a helper script which only functions to re-run keybindings_script.ahk

Set the path below to the absolute path of your keybindings_script.ahk, and this can also be set to run at startup using the same steps from the installation section above.

```
RCtrl & Enter::run("<absolute path to keybindings_script.ahk>")
```

## Known Quirks / Gotchas

- **Numpad digit keys (0–9)** should never be used as a Magic Key trigger — Windows' built-in Alt+Numpad character input feature swallows them while Alt is held. Use `NumpadDiv/Mult/Sub/Add/Dot` or letter keys instead.
- **`LAlt & h/j/k/l` (Vim keys) can conflict** with any Magic Key combo using the same letter, since Left Alt is part of the Magic Key's held modifiers. Avoid reusing `h/j/k/l` for Magic Key combos.
