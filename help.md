# vim: set filetype=markdown
**Should be synced with ~/notes/dotfiles-shortcuts**

# 1. My dot files
templates. To view markdown file the alias uses a terminal markdown viewer
This guide goes through what aliases are available by using the provided
called mdp (https://github.com/visit1985/mdp).
    - mac: brew install mdp
    - debian: sudo apt═get install libncursesw10 libncurses═devel
    - Rasp: sudo apt═get install libncurses5═dev libncursesw5═dev

## 1.1. ZSH tricks

╔═══════════════════════════╦══════════════════════════════════════════════════════════════╗
║ aliases                   ║ Desc                                                         ║
╠═══════════════════════════╬══════════════════════════════════════════════════════════════╣
║                           ║                                                              ║
║ **Escape Sequences**          ║                                                              ║
║ Esc-.(period)             ║ Insert the last argument of the previous command line.       ║
║ .                         ║ Repeat to retrieve arguments from earlier lines.             ║
║ man -k randr              ║ List all man pages that include a specific word.             ║
║ look echo ~/.zshrc        ║ Prints only the first word on the matching lines.            ║
║ watch -n 3 ps -aux X      ║ Prints only the first word on the matching lines.            ║
║ stat -c '%n %a' ~/.zshrc  ║ Provides information about the file with ═c you can specify  ║
║                           ║ which fields you want to show: %n name, %a access rights     ║
║                           ║                                                              ║
╠═╣    Shortcut keys  ╠═════╬═════╣                                                        ║
║                           ║                                                              ║
║ alt + h                   ║ Shows this file using vim                                    ║
║                           ║                                                              ║
╚═══════════════════════════╩══════════════════════════════════════════════════════════════╝

## 1.2. Custom aliases:

╔════════════════════════╦══════════════════════════════════════════════════════════════╗
║ aliases                ║ Desc                                                         ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║ **Help Pages**             ║                                                              ║
║                        ║                                                              ║
║ help                   ║ Displays this help page.                                     ║
║ h                      ║ Grep history for a specific keyword                          ║
║ zdoc                   ║ Opens zsh pdf document.                                      ║
║                        ║                                                              ║
║ **Config Aliases**         ║                                                              ║
║                        ║                                                              ║
║ m                      ║ cd ~/MyDotFiles                                              ║
║ x                      ║ cd ~/doti3                                                   ║
║ zc                     ║ vim ~/.zshrc                                                 ║
║ zlc                    ║ vim ~/zshrc.local.sh                                         ║
║ ic                     ║ vim ~/.config/i3/config                                      ║
║ zcc                    ║ open `~/git/MyDotFiles` in VSCode                            ║
║ icc                    ║ open `~/git/doti3` in VSCode                                 ║
║                        ║                                                              ║
║ **App Openers**            ║                                                              ║
║                        ║                                                              ║
║ idea                   ║ Opens a file or folder in IntelliJ Idea                      ║
║ subl                   ║ Opens a file or folder in sublime texteditor                 ║
║ atom                   ║ Opens a file or folder in atom texteditor                    ║
║                        ║                                                              ║
║ **Operations**             ║                                                              ║
║                        ║                                                              ║
║ ds                     ║ Calculates subfolder sizes in a directory                    ║
║                        ║ **EQ:**  to 'du -hd 1'                                           ║
║                        ║                                                              ║
║ ex                     ║ Make a file executable                                       ║
║                        ║ **EQ:** eq. to `chmod u+x`                                       ║
║                        ║                                                              ║
║ ff                     ║ Search current folder for a partial filename                 ║
║                        ║ **Usage:** `$ ff .json`                                          ║
║                        ║                                                              ║
║ rgrep                  ║ Search current folder for a specific keyword                 ║
║                        ║ including all subfolders                                     ║
║                        ║ **Usage:** $ rgrep alias                                         ║
║                        ║ **EQ:** `grep --color=always -R -i "$1" | less;`                 ║
║                        ║                                                              ║
║ rfind                  ║                                                              ║
║                        ║ **Usage:** `$ rfind mac.sh`                                      ║
║                        ║ **EQ:** `find . -iname "*$1*" | grep -i "$1" --color=always`     ║
║                        ║                                                              ║
║ dq                     ║ query installed packages and list their files                ║
║                        ║ Usage:** $ dq ls                                               ║
║                        ║                                                              ║
║ extract                ║ extracts a file into the destination folder using `tar`      ║
║                        ║ **Usage:** `$ extract x.tar "/your/destination"`                 ║
║                        ║ **EQ:** `tar xf $1 -C $2;`                                       ║
║                        ║                                                              ║
║ **Web Search**             ║                                                              ║
║                        ║                                                              ║
║ google                 ║ Search Google for a specific term                            ║
║ ddg                    ║ Search DuckDuckGo for a specific term                        ║
║ ducky                  ║ Search DuckDuckGo for a specific term (I'm feeling lucky)    ║
║ bing                   ║ Search Bing for a specific term                              ║
║ wiki                   ║ Search Wikipedia for a specific term                         ║
║ youtube                ║ Search Youtube for a specific term                           ║
║ news                   ║ Search Google news for a specific term                       ║
║ map                    ║ Search Google maps for a specific term                       ║
║ image                  ║ Search images.google.com for a specific term                 ║
╚════════════════════════╩══════════════════════════════════════════════════════════════╝

## 1.3. zsh shortcuts

╔════════════════════════╦══════════════════════════════════════════════════════════════╗
║ Shortcuts              ║ Desc                                                         ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║ ALT + h                ║ Display help(info) on the first word of the line             ║
║                        ║                                                              ║
║ ALT + .                ║ Cycle through previous parameter in history                  ║
║ ALT + p                ║ Cycle through previous statements                            ║
║ ALT + n                ║ Cycle through next statements                                ║
║                        ║                                                              ║
║ ALT + f                ║ Complete next word using previous statement/Jump to next wrd ║
║ ALT + b  (<alt>+b)     ║ Jump back one word                                           ║
║ ESC + b  (\eb)         ║ Jump back one word                                           ║
║ META + b (M-b)         ║ Jump back one word                                           ║
║ ALT + c                ║ [fzf] Show fzf dropdown for all files in the current path    ║
║ CTRL + x + b           ║ Match bracket                                                ║
║                        ║                                                              ║
║ Esc  + v               ║ Edit command line with vim ( Esacape then v )                ║
║ CTRL + x + e           ║ Edit command line with vim ( ctrl + x then e )               ║
║ CTRL + grave           ║ Edit command line with vim ( ctrl + `)                   `   ║
║                        ║                                                              ║
║ ALT + SHIFT + r        ║ Go to REPLACE mode                                           ║
║ ALT + i                ║ Go to INSERT mode                                            ║
║                        ║                                                              ║
║ ALT + u                ║ Change next word to upper case                               ║
║ ALT + l                ║ Change next word to lower case                               ║
║ ALT + SHIFT + m        ║ Insert return without executing                              ║
║ ALT + '                ║ Quote line                                                   ║
║ ALT + "                ║ Quote region ( from start to cursor pos )                    ║
║                        ║                                                              ║
║ ALT + d                ║ Delete next word                                             ║
║ CTRL + w               ║ Delete pervious word                                         ║
║ CTRL + k               ║ Delete from cursor pos to the end of the line                ║
║ CTRL + u or CTRL + _   ║ Delete the whole line                                        ║
║                        ║                                                              ║
║ CTRL + e               ║ Go to the end of the line                                    ║
║ CTRL + a               ║ Go to the begining of the line                               ║
║ CTRL + b               ║ Backward delete char                                         ║
║ CTRL + h               ║ Backspace!                                                   ║
║                        ║                                                              ║
║ ALT + ?                ║ Replace and execute `which` for the current starting cv .g   ║
║ ALT + x                ║ execute═named═cmd  widget would be called                    ║
║ CTRL + j               ║ Accept line                                                  ║
║ CTRL + m               ║ Accept line                                                  ║
║                        ║                                                              ║
╠═╣ Custom  shortcuts ╠══╬═════╣                                                        ║
║                        ║                                                              ║
║                        ║                                                              ║
║ ALT  + s               ║ Git status for the current folder                            ║
║ ALT  + w               ║ Switch to different theme                                    ║
║ ALT  + k               ║ Kill the whole line                                          ║
║ ALT  + v               ║ Edit the current line in vim                                 ║
║                        ║                                                              ║
╚════════════════════════╩══════════════════════════════════════════════════════════════╝

## 1.4. ZLE :

╔════════════════════════╦══════════════════════════════════════════════════════════════╗
║ Commands               ║ Desc                                                         ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║ zle -la                ║ List all available widgets                                   ║
║ bindkey                ║ List all key mappings                                        ║
║ bindkey -M vicmd       ║ List all key mappings in vicmd mode                          ║
║ bindkey -v             ║ V emulation mode                                             ║
║ bindkey -e             ║ Emacs emulation mode                                         ║
║                        ║                                                              ║
║ bindkey '^m'           ║ Shows a keybinding for a keymap in this case CTRL + m        ║
║ bindkey -M viins 'b'   ║ Shows a keybinding for Vi insert mode                        ║
║ bindkey -M vicmd 'b'   ║ Shows a keybinding for Vi command line mode                  ║
║ bindkey -M emacs 'b'   ║ Shows a keybinding for Emacs mode                            ║
║                        ║                                                              ║
║ '\e'                   ║ Stands for <ALT>                                             ║
║ '^'                    ║ Stands for <ctrl>                                            ║
║                        ║                                                              ║
╠════════════════════════╩════════════════════════╦═════════════════════════════════════╣
║ bindkey -s '\es' '^Ugit status^M'               ║  bind alt+s to git status           ║
║ bindkey "^X^E" edit-command-line                ║  bind c-x x-e to edit by vim (emacs)║
║ bindkey "^X^E" edit-command-line                ║  bind c-x x-e to edit by vim (emacs)║
║ bindkey -M vicmd v edit-command-line            ║  bind Esc-v to edit by vim (vimode) ║
╠════════════════════════╦════════════════════════╩═════════════════════════════════════╣
║ Esc-:                  ║ Shows execute named command prompt and you can run widgets   ║
╠════════════════════════╩══════════════════════════════════════════════════════════════╣
║ completions are defined in zsh/compinit lookat kubectl as an example on how you can   ║
║ define the same completion for an alias                                               ║
║                                                                                       ║
╠═══════════════════════════════════════════════════════════════════════════════════════╣
║ https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org    ║
║                                                                                       ║
║                                                                                       ║
╚═══════════════════════════════════════════════════════════════════════════════════════╝

## 1.5. Vifm

╔══════════════════════════╦═════════════════════════════════════════╗
║ command                  ║ description                             ║
╠══════════════════════════╬═════════════════════════════════════════╣
║                          ║                                         ║
╠═╣    Preview       ╠═════╣                                         ║
║                          ║                                         ║
║ w                        ║ Preview on the alternate pane           ║
║ e                        ║ Preview on the current pane             ║
║ q                        ║ Quit preview                            ║
║ CTRL+w z                 ║ Quit all preview modes                  ║
║ SHIFT+TAB                ║ Switch to preview tab inorder to scroll ║
╚══════════════════════════╩═════════════════════════════════════════╝

## 1.10.1 Other

╔════════════════════════╦══════════════════════════════════════════════════════════════╗
║ Commands               ║ Desc                                                         ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║ **Packages**               ║                                                              ║
║                        ║                                                              ║
║ ,pkg-graph             ║ Visualizes the dependency graph for a package                ║
║                        ║ **Usage:** `,pkg-graph ssh`                                      ║
║                        ║                                                              ║
║ ,pkg-info              ║ Tries to find a file within not installed packages           ║
║                        ║ **Usage:** `,pkg-info wmpinboard`                                ║
║                        ║ **Usage:** `,pkg-info <enter>`                                   ║
║                        ║                                                              ║
║ ,pkg-find              ║ Tries to find a file within not installed packages           ║
║                        ║ **Usage:** `,pkg-find otfinfo`                                   ║
║                        ║ **Usage:** `,pkg-find <enter>` (very slow)                       ║
║                        ║                                                              ║
║ asf                    ║ Uses fzf to list all files installed by packageses           ║
║                        ║ **Usage:** `asf <enter>` and search for `_apt`                    ║
║                        ║                                                              ║
║ aps                    ║ Alias for aptitude search, searches in not installed packages║
║                        ║ **Usage:** `aps pinboard`                                        ║
║                        ║                                                              ║
║ dq                     ║ Query an installed package and list its fileskages           ║
║                        ║ **Usage:** `dq help`                                             ║
║                        ║                                                              ║
║ **Services**               ║                                                              ║
║                        ║                                                              ║
║ ,s                     ║ Show/rotate logs for different services using a rofi dialog  ║
║                        ║ **Usage:** `,s <enter>`                                          ║
║                        ║        `,s idsvr.service`                                    ║
║                        ║        `,s idsvr.service lnav`                               ║
║                        ║                                                              ║
║ sc                     ║ Alias for systemctl                                          ║
║                        ║ **Usage:** `sc <tab>`                                            ║
║                        ║                                                              ║
║ **Processes**              ║                                                              ║
║                        ║                                                              ║
║ ,ps                    ║ **EQ:** `ps -aux | grep $@`                                      ║
║                        ║ **Usage:** `,ps perl`                                            ║
║ pp                     ║ same as above just for sudo                                  ║
║                        ║                                                              ║
║ **Man pages**              ║                                                              ║
║                        ║                                                              ║
║ help                   ║ Displays this help page.                                     ║
║ h                      ║ Grep history for a specific keyword                          ║
║ zdoc                   ║ Opens zsh pdf document.                                      ║
║ mann <command>         ║ Opens https://manned.org manual page for the command         ║
║ mank <command>         ║ Opens https://www.mankier.com manual page for the command    ║
║ mand <command>         ║ Opens https://manpages.debian.org manual page for the command║
╚════════════════════════╩══════════════════════════════════════════════════════════════╝

## 1.10.2 Tab completion helpers
The follwing commands or aliases support special tab completion. Write the alias
and press <Tab> to access helpers. These completion helpers are usually defined in
`zsh/compinit.sh`, or `zsh/completion/`, or `zsh/completion/plugins/fzf/shell/completion.zsh`,
or `fzf.zsh`.

╔════════════════════════╦══════════════════════════════════════════════════════════════╗
║ Commands               ║ Desc                                                         ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║                        ║                                                              ║
║ kill                   ║ Gives the list of process with nice details about them       ║
║                        ║ you will be able to select and kill theme                    ║
║                        ║                                                              ║
║ takenote               ║ Gives you the list of all files in ~/note folder and you     ║
║                        ║ edit them in vim by selecting one of the rows                ║
║                        ║                                                              ║
║ dq                     ║ lists all installed packaged by picking one you can see      ║
║                        ║ what files are installed by them                             ║
║                        ║                                                              ║
║ t                      ║ t will be completed by todo.txt                              ║
║                        ║                                                              ║
║ ~~                     ║ `~~` will trigger fzf file selection for the current folder  ║
║                        ║ **EX:** `vim ~~<tab>`                                            ║
║                        ║                                                              ║
╚════════════════════════╩══════════════════════════════════════════════════════════════╝


## 1.10.3 Useful manual pages

╔════════════════════════╦══════════════════════════════════════════════════════════════╗
║ Commands               ║ Desc                                                         ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║                        ║                                                              ║
║ mann zshexpn           ║ Manual page for zsh expansions                               ║
╚════════════════════════╩══════════════════════════════════════════════════════════════╝


