# vim: set filetype=markdown 

# 1. My dot files 
templates. To view markdown file the alias uses a terminal markdown viewer
This guide goes through what aliases are available by using the provided
called mdp (https://github.com/visit1985/mdp).
    - mac: brew install mdp
    - debian: sudo apt═get install libncursesw10 libncurses═devel
    - Rasp: sudo apt═get install libncurses5═dev libncursesw5═dev

## 1.1. vim
to open several files in split mode use:

`vim -O *.txt`

or

`vim -O ~/.zshrc ~/zshrc.local.sh`

to enable plugin docs (help), you need to run

`:helptags ALL`

Commands

╔══════════════════════════════╦═════════════════════════════════════════════════════════════════════╗
║ command                      ║ description                                                         ║
╠══════════════════════════════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
╠════╣ files and buffers ╠═════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║                              ║                                                                     ║
║ shift + right/left arrow     ║ move to next or previous buffer                                     ║
║ ctrl+wc or ctrl+q            ║ close current buffer                                                ║
║ ,,                           ║ toggle previous buffer                                              ║
║ :bd                          ║ close current buffer                                                ║
║ ,q                           ║ delete current buffer and move on                                   ║
║ :vert help e                 ║ show help in vertical mode                                          ║
║ :vsp                         ║ open another file in vertical                                       ║
║ :vsp ~/.zshrc                ║ open another file in vertical                                       ║
║ :e ~/.zshrc                  ║ open another file in a new buffer                                   ║
║ :set splitright              ║ set files to open in right                                          ║
║ :vsp#2                       ║ vertical split                                                      ║
║ :h tag                       ║ open help page for tag vertically                                   ║
║ :e!                          ║ reload current file                                                 ║
║                              ║                                                                     ║
╠══╣ Buffer manipulation ╠═════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║                              ║                                                                     ║
║ :bn                          ║ next buffer                                                         ║
║ ,q                           ║ delete current buffer and move on                                   ║
║                              ║                                                                     ║
║                              ║                                                                     ║
╠══╣ **Window manipulation** ╠═════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ :help CTRL-W                 ║ see also                                                            ║
║ :help opening-window         ║                                                                     ║
║                              ║                                                                     ║
║                              ║                                                                     ║
║ CTRL-W n         :new        ║ edit a new buffer                                                   ║
║ CTRL-W s         :sp         ║ split buffer                                                        ║
║ CTRL-W v         :vsp        ║ split vertically                                                    ║
║ CTRL-W o         :only       ║ only this window                                                    ║
║ CTRL-W c         :close      ║ close window ( close cannot close last window )                     ║
║ CTRL-W q         :quit       ║ quit window  ( quit can also close last window )                    ║
║ CTRL+W H,J,K, or L           ║ will move the current window to the far left, bottom, top, or right ║
║ CTRL+W h,j,k, or l           ║ will focus instead of moving the windows                            ║
║ CTRL+W v                     ║ split current window                                                ║
║                              ║                                                                     ║
║ #N <c-w>\_                   ║ set height to #N (ex. `50<C-w>_`)                                   ║
║ #N <c-w>|___                    ║ set width  to #N (ex. `50<C-w>|`)                                   ║
║ <c-w> =                      ║ equalize width and height of all windows                            ║
║                              ║                                                                     ║
║ <c-e> <c-e>                  ║ Toggle single mode through ZoomWin plugin (second toggle is slow)   ║
║                              ║                                                                     ║
╠════╣ search & replace ╠══════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ :%s//new-string/g            ║ First use * to highlight the words, then run this for replacing all ║
║ <c-n>                        ║ This is a shortcut for the above one liner                          ║
║                              ║                                                                     ║
║ :%s/foo/bar/g                ║ replaces foo with bar in all lines                                  ║
║ :s/foo/bar/g                 ║ replaces foo with bar only in current line                          ║
║ :%s/foo/bar/gc               ║ replaces all foos with bar but asks each time                       ║
║ :%s/\<foo\>/bar/gc           ║ replaces all exact "foo"s with "bar" with confirmation              ║
║ :%s/foo/bar/gci              ║ (case insensitive) replaces all "foo"s with "bar" with confirmation ║
║ :set ignorecase              ║ make all searches case insensitive                                  ║
║                              ║                                                                     ║
║                              ║                                                                     ║
╠═══════╣ Key mapping ╠════════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║                              ║                                                                     ║
║ :verbose imap <tab>          ║ Show where the keymap is defined and in which file/plugin           ║
║ :scripts                     ║ Shows all effective scripts                                         ║
║ :map                         ║ Show all keymaps                                                    ║
║ F9        :call ExportMap()  ║ Exports all keymapping to /tmp/vi_maps.txt and opens it in vim      ║
║                              ║                                                                     ║
╠═══╣ Syntax Highlighter ╠═════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║                              ║                                                                     ║
║ :set syntax=yaml             ║ for wrong or unknown types you can manually set syntax              ║
║                              ║                                                                     ║
║                              ║                                                                     ║
╠══════╣ spell checker ╠═══════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ ,s                           ║ toggle spell checker                                                ║
║ z=                           ║ show the suggestions                                                ║
║ zg                           ║ add to dictionary                                                   ║
║                              ║                                                                     ║
╠══╣ white space ╠═════════════╣                                                                     ║
║                              ║                                                                     ║
║ set list                     ║ show listchars including tab                                        ║
║ set nolist                   ║ hide listchars including tab                                        ║
║ :w !sudo tee %               ║ save file with sudo privileges                                      ║
║                              ║                                                                     ║
╠══╣ function key mapping ╠════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ F2                           ║ toggle paste ~/paste                                                ║
║ F3                           ║ Toggle nerd tree                                                    ║
║ F4                           ║ Toggle highlight                                                    ║
║ F5                           ║ Toggle list invisible characters like tabs                          ║
║ F6                           ║ Toggle showing the line numbers (set norelativenumber for absolute) ║
║ F8                           ║ Toggle wrap and its indicator                                       ║
║                              ║                                                                     ║
╠══╣     vim-sneak        ╠════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ sab                          ║ Type sab to move the cursor to next instance of "ab"                ║
║ ;                            ║ Go to the next match (or s agin if s_next is enabled)               ║
║ ``                           ║ `` Go back to the starting point or jump back                       ║
║                              ║                                                                     ║
╠══╣  visual block mode   ╠════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ ctrl + v                     ║ By pressing ctrl+v you can enter visual block mode, when you are in ║
║ ════════╕                    ║ visual block mode you can do the following actions:                 ║
║         │                    ║                                                                     ║
║         ├─ shift+i           ║ goto insert mode. Any character typed will be inserted at top       ║
║         │                    ║ of the selection and when pressing <esc> it would be applied to all ║
║         │                    ║                                                                     ║
║         ├─ c                 ║ change the selected area                                            ║
║         ├─ r                 ║ change the current character                                        ║
║         ├─ o                 ║ move to the begining of the selected box                            ║
║                              ║                                                                     ║
╠══╣     vim-neosnippets  ╠════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ ctrl + k                     ║ Choose snippet                                                      ║
║ tab                          ║ Move to the next field of the snippet                               ║
║ ctrl + p                     ║ Previous item in neocomplete list                                   ║
║ ctrl + n                     ║ Next     item in neocomplete list                                   ║
║                              ║                                                                     ║
╠══╣     vim-sorround     ╠════╬═══╦═════════════════════════════════════════════════════════════════╣
║                              ║   ║                                                                 ║
║ cs'"                         ║   ║ Change Sorround ' -> "  (do it inside 'test')                   ║
║ cs' then <q>                 ║   ║ Change Sorround ' -> <q> (do it inside 'test')                  ║
║ ds'                          ║   ║ Remove delimiter sorrounding of ' (do it inside 'test')         ║
║ di'                          ║   ║ Remove inside sorrounfing of ' (do it inside 'test')            ║
║ vllllllls'                   ║   ║ Sorround virtual selection with ' (go to V then 4left and s)    ║
║ ysiw(                        ║   ║ Sorround word with (         ex:  ( sneak )                     ║
║ ysiW(                        ║   ║ Sorround whole word with (   ex:  ( g:sneak#s-next = 1 )        ║
║ ysw(                         ║   ║ Sorround word with (         ex:  ( sneak )                     ║
║ ysW(                         ║   ║ Sorround whole word with (   ex:  ( g:sneak#s-next = 1 )        ║
║                              ║   ║                                                                 ║
║                              ║   ║   The difference between ysiw and ysw is that with i(nner text) ║
║                              ║   ║   the whole word would be modified however without it from the  ║
║                              ║   ║   cursor position to the end of the word will be sorrounded     ║
║                              ║   ║                                                                 ║
║ yss                          ║   ║ yss operates on the current line ignoring the leading space     ║
║ yssB                         ║   ║ Sorround current line with block: {Hello world!}                ║
║ yssb                         ║   ║ Sorround current line with parantesis: (Hello world!)           ║
║                              ║   ║                                                                 ║
║ ySS                          ║   ║ Sorrounds the current line but puts delimters in separate lines ║
║                              ║   ║ and idents the current line                                     ║
║                              ║   ║                                                                 ║
║ <c-g>                        ║   ║ In insert mode starts writing in a block                        ║
║                              ║   ║                                                                 ║
║ vS                           ║   ║ In visual mode a capital S will result in sorrounding lines     ║
║ vS"                          ║   ║ Sorround selection with "                                       ║
╠═════╣ miscellaneous ╠════════╬═══╩═════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ <ctrl>/                      ║ Toggle comment for the selected text or block                       ║
║ gc                           ║ Toggle comment for the selected text or block                       ║
║ g>                           ║ Toggle comment for the selected text or block                       ║
║                              ║                                                                     ║
║ set nonumber                 ║ Hide line numbers                                                   ║
║ set number                   ║ Show line numbers                                                   ║
║ set tm=0                     ║ Set timeout to 0, causes faster response and no waiting             ║
║ set tm=1000                  ║ Set timeout to 1000, good for cases that leader shortcuts dont work ║
║                              ║                                                                     ║
║ .                            ║ Auto compilation                                                    ║
║ :w!!                         ║ Vim sudo trick or :w !sudo tee > /dev/null %                        ║
║ <ctrl>o                      ║ Vim sudo trick or :w !sudo tee > /dev/null %                        ║
║ :red                         ║ Redo                                                                ║
║ <ctrl>r                      ║ Reload (notifies if file has been changed)                          ║
║ <ctrl-shift>r                ║ Force reload :e!<CR>                                                ║
║                              ║                                                                     ║
╚══════════════════════════════╩═════════════════════════════════════════════════════════════════════╝

## 1.2. Vifm

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

## 1.3. ZSH tricks

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
║ ctrl + h                  ║ Shows this file using vim                                    ║
║                           ║                                                              ║
╚═══════════════════════════╩══════════════════════════════════════════════════════════════╝

## 1.4. Custom aliases:

╔════════════════════════╦══════════════════════════════════════════════════════════════╗
║ aliases                ║ Desc                                                         ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║ **Help Pages**             ║                                                              ║
║ help                   ║ Displays this help page.                                     ║
║ h                      ║ Grep history for a specific keyword                          ║
║ zdoc                   ║ Opens zsh pdf document.                                      ║
║ **App Openers**            ║                                                              ║
║ idea                   ║ Opens a file or folder in IntelliJ Idea                      ║
║ subl                   ║ Opens a file or folder in sublime texteditor                 ║
║ atom                   ║ Opens a file or folder in atom texteditor                    ║
║ **Operations**             ║                                                              ║
║ ds                     ║ Calculates subfolder sizes in a directory                    ║
║ .                      ║ **EQ:**  to 'du ═hd 1'                                           ║
║ Make a file executable ║                                                              ║
║ .                      ║ **EQ:** eq. to `chmod u+x`                                       ║
║ rgrep                  ║ Search current folder for a specific keyword                 ║
║ .                      ║ including all subfolders                                     ║
║ .                      ║ **Usage:** $ rgrep alias                                         ║
║ .                      ║ **EQ:** `grep ══color=always ═R ═i "$1" ‖ less;`                 ║
║ rfind                  ║                                                              ║
║ .                      ║ **Usage:** `$ rfind mac.sh`                                      ║
║ .                      ║ **EQ:** `find . ═iname "*$1*" ‖ grep ═i "$1" ══color=always`     ║
║ dq                     ║ query installed packages and list their files                ║
║ **Usage:** $ dq ls         ║                                                              ║
║ extract                ║ extracts a file into the destination folder using `tar`      ║
║ .                      ║ **Usage:** `$ extract x.tar "/your/destination"`                 ║
║ .                      ║ **EQ:Usage:** `tar xf $1 ═C $2;`                                 ║
║ **Web Search**             ║                                                              ║
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

## 1.5. zsh shortcuts

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
║ ALT  + s               ║ Git status for the current folder                            ║
║ ALT  + w               ║ Switch to different theme                                    ║
║                        ║                                                              ║
╚════════════════════════╩══════════════════════════════════════════════════════════════╝

## 1.6. ZLE :

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
║ '/e'                   ║ Stands for <ALT>                                             ║
║ '^'                    ║ Stands for <ctrl>                                            ║
║                        ║                                                              ║
╠════════════════════════╩════════════════════════╦═════════════════════════════════════╣
║ bindkey -s '\es' '^Ugit status^M'               ║  bind alt+s to git status           ║
║ bindkey "^X^E" edit-command-line                ║  bind c-x x-e to edit by vim (emacs)║
║ bindkey "^X^E" edit-command-line                ║  bind c-x x-e to edit by vim (emacs)║
║ bindkey -M vicmd v edit-command-line            ║  bind Esc-v to edit by vim (vimode) ║
╠════════════════════════╦════════════════════════╩═════════════════════════════════════╣
║ Esc-:                  ║ Shows execute named command prompt and you can run widgets   ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║                        ║                                                              ║
╚════════════════════════╩══════════════════════════════════════════════════════════════╝

## 1.x. Other

╔════════════════════════╦══════════════════════════════════════════════════════════════╗
║ Commands               ║ Desc                                                         ║
╠════════════════════════╬══════════════════════════════════════════════════════════════╣
║                        ║                                                              ║
║ help                   ║ Displays this help page.                                     ║
║ h                      ║ Grep history for a specific keyword                          ║
║ zdoc                   ║ Opens zsh pdf document.                                      ║
╚════════════════════════╩══════════════════════════════════════════════════════════════╝


