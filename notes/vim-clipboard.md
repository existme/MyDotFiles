#vim clipboard

------------------------------------------------------ 

## Does your vim supports clipboard?

```bash
vim --version | grep clipboard
```

if you have something like this:

```bash
+clipboard       +job             +path_extra      +user_commands
+eval            +mouse_dec       +statusline      +xterm_clipboard
```

If one of the clipboards have `-` before them, then:

```bash
sudo apt install vim-gt
```

## Copy to clipboard
use <kbd>ctrl</kbd>+<kbd>c</kbd> or `"+y` or `"*y` depending on your OS.

------------------------------------------------------
2017-09-23 13:16:37
