<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" class="logo" width="120"/>

## Quick Start Guide: Nano Text Editor for Beginners

Nano is a user-friendly, command-line text editor available on most Linux systems. It’s ideal for beginners due to its simplicity and intuitive keyboard shortcuts.

---

**Getting Started**

- **Opening Nano**
    - To edit or create a file, use:

```
nano filename
```

Replace `filename` with your desired file name. If the file doesn’t exist, Nano will create it[^1_2][^1_4][^1_6].
    - To open Nano without a file (creates a new untitled file):

```
nano
```

You’ll be prompted to name the file upon saving[^1_6].
- **Navigating in Nano**
    - Use the arrow keys to move the cursor around.
    - Start typing to add or edit text—no special mode required[^1_1][^1_3].

---

**Basic Commands**

At the bottom of the Nano screen, you’ll see shortcuts. The caret symbol (`^`) means “Ctrl”. For example, `^X` means “Ctrl + X”.


| Command | Action |
| :-- | :-- |
| Ctrl + O | Save file (“Write Out”) |
| Ctrl + X | Exit Nano |
| Ctrl + G | Show help (list of all commands) |
| Ctrl + K | Cut current line |
| Ctrl + U | Paste cut line |
| Ctrl + W | Search for text |
| Ctrl + C | Show current cursor position |
| Ctrl + A | Jump to beginning of line |
| Ctrl + E | Jump to end of line |
| Ctrl + Y | Page up |
| Ctrl + V | Page down |

- To save changes:
Press **Ctrl + O**, then **Enter** to confirm the filename[^1_2][^1_4][^1_5].
- To exit:
Press **Ctrl + X**. If you have unsaved changes, Nano will prompt you to save (press **Y** for yes, **N** for no)[^1_2][^1_4][^1_6].

---

**Editing Tips**

- **Cutting and Pasting:**
    - **Ctrl + K** cuts the current line.
    - **Ctrl + U** pastes the last cut text.
- **Searching:**
    - **Ctrl + W** starts a search. Enter your search term and press **Enter**[^1_2][^1_5].
- **Undo/Redo:**
    - **Alt + U** to undo.
    - **Alt + E** to redo[^1_5].

---

**Other Useful Shortcuts**

- **Ctrl + _**: Go to a specific line and column.
- **Ctrl + T**: Spell check (if available).
- **Ctrl + R**: Insert another file’s contents at the cursor[^1_2][^1_5].

---

**Exiting Nano**

- Press **Ctrl + X**.
- If prompted to save, press **Y** (yes) or **N** (no), then **Enter**[^1_2][^1_4][^1_6].

---

**Getting Help**

- Press **Ctrl + G** at any time for a summary of commands[^1_2][^1_4][^1_5].

---

**Installation (if not already installed)**

Most Linux distributions include Nano by default. If not, install it with:

```
sudo apt install nano
```

(on Debian/Ubuntu)[^1_1][^1_6].

---

Nano is a straightforward editor—just open, type, and use the keyboard shortcuts above to manage your files efficiently.

<div style="text-align: center">⁂</div>

[^1_1]: https://www.youtube.com/watch?v=g2PU--TctAM

[^1_2]: https://www.hostinger.com/in/tutorials/how-to-install-and-use-nano-text-editor

[^1_3]: https://www.youtube.com/watch?v=PDWHxh9HUF8

[^1_4]: https://linuxize.com/post/how-to-use-nano-text-editor/

[^1_5]: https://www.nano-editor.org/dist/latest/cheatsheet.html

[^1_6]: https://phoenixnap.com/kb/use-nano-text-editor-commands-linux

[^1_7]: https://www.howtogeek.com/42980/the-beginners-guide-to-nano-the-linux-command-line-text-editor/

[^1_8]: https://www.nano-editor.org/dist/v2.2/nano.html

[^1_9]: https://www.comptia.org/blog/your-nano-tutorial-create-edit-and-save-files

[^1_10]: https://askubuntu.com/questions/54221/how-to-edit-files-in-a-terminal-with-nano

