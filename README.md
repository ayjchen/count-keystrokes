# count-keystrokes

A simple AutoHotKey v1 script that counts keyboard strokes that are pressed.


## Running script on launch

### Windows
Create a shortcut to the script and place it in the Windows startup folder:

1. Open the repo, right-click on the script file, and select "Create shortcut".
2. Copy the shortcut.
3. Press `Win` + `R` to open the Run dialog box.
4. Type `shell:startup` and press `Enter` to open the startup folder. 
5. Paste the shortcut into the startup folder.

The script will continuously increment count into the same output file, even across script and system relaunches.

---
This script was created to track keypress frequencies for data analysis to better determine suitable keyboard sizes according to daily usage.
