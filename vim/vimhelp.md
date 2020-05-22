## 1.1. vim
╔══════════════════════════════╦═════════════════════════════════════════════════════════════════════╗
║ command                      ║ description                                                         ║
╠══════════════════════════════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
╠════╣ files and buffers ╠═════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║                              ║                                                                     ║
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
║ ctrl+wc or ctrl+q            ║ close current buffer                                                ║
║ ctrl+w ctrl+w                ║ close current buffer (if this is the last buffer exit)              ║
║ :bd                          ║ close current buffer                                                ║
║ ,q                           ║ delete current buffer and move on                                   ║
║                              ║                                                                     ║
║ ,,                           ║ toggle previous buffer                                              ║
║ shift + right/left arrow     ║ move to next or previous buffer                                     ║
║ :bn                          ║ next buffer                                                         ║
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
║ /q                           ║ will unselect/unhighlight what ever you have selected or searched   ║
║ // followd by <c-n>          ║ Select visually some text and in vmod press // to search the whole  ║
║                              ║ document for it. After selection is made use <c-n> to replace       ║
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
║ F7                           ║ Toggle showing undo tree                                            ║
║ F8                           ║ Toggle wrap and its indicator                                       ║
║ F9                           ║ Show all keybindings                                                ║
║ F10                          ║ Trim all white spaces in the current file                           ║
║ ctrl + l                     ║ Preview markdown page using `bat`                                   ║
║ ctrl + F5                    ║ Save and run the current file                                       ║
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
╠══╣     vim-sorround     ╠════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║                              ║                                                                     ║
╠══╣ visual mode              ═╬═                                                                   ═╣
║                              ║                                                                     ║
║ S"                           ║ Sorround selection with "                                           ║
║ u                            ║ Change the currently selected block to lowercase                    ║
║ U                            ║ Change the currently selected block to uppercase                    ║
║                              ║                                                                     ║
╠══╣ normal mode              ═╬═                                                                   ═╣
║                              ║                                                                     ║
║ cs'"                         ║  Change Sorround ' -> "  (do it inside 'test')                      ║
║ cs' then <q>                 ║  Change Sorround ' -> <q> (do it inside 'test')                     ║
║ ds'                          ║  Remove delimiter sorrounding of ' (do it inside 'test')            ║
║ di'                          ║  Remove inside sorrounfing of ' (do it inside 'test')               ║
║ vllllllls'                   ║  Sorround virtual selection with ' (go to V then 4left and s)       ║
║                              ║                                                                     ║
╠══╣ insert mode              ═╬═                                                                   ═╣
║                              ║  #sorround                                                          ║
║ ysiw(                        ║  Sorround word with (         ex:  ( sneak )                        ║
║ ysiW(                        ║  Sorround whole word with (   ex:  ( g:sneak#s-next = 1 )           ║
║ ysw(                         ║  Sorround word with (         ex:  ( sneak )                        ║
║ ysW(                         ║  Sorround whole word with (   ex:  ( g:sneak#s-next = 1 )           ║
║                              ║                                                                     ║
║                              ║    The difference between ysiw and ysw is that with i(nner text)    ║
║                              ║    the whole word would be modified however without it from the     ║
║                              ║    cursor position to the end of the word will be sorrounded        ║
║                              ║                                                                     ║
║ yss                          ║  yss operates on the current line ignoring the leading space        ║
║ yssB                         ║  Sorround current line with block: {Hello world!}                   ║
║ yssb                         ║  Sorround current line with parantesis: (Hello world!)              ║
║                              ║                                                                     ║
║ ySS                          ║  Sorrounds the current line but puts delimters in separate lines    ║
║                              ║  and idents the current line                                        ║
║                              ║                                                                     ║
║ <c-g>                        ║  In insert mode starts writing in a block                           ║
║                              ║                                                                     ║
║ vS                           ║  In visual mode a capital S will result in sorrounding lines        ║
║ vS"                          ║  Sorround selection with "                                          ║
╠═════╣ miscellaneous ╠════════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ <ctrl>/                      ║ Toggle comment for the selected text or block  #comment #toggle     ║
║ gc                           ║ Toggle comment for the selected text or block                       ║
║ g>                           ║ Toggle comment for the selected text or block                       ║
║                              ║                                                                     ║
║ set nonumber                 ║ Hide line numbers   #hide #line #lineno                             ║
║ set number                   ║ Show line numbers                                                   ║
║ set tm=0                     ║ Set timeout to 0, causes faster response and no waiting             ║
║ set tm=1000                  ║ Set timeout to 1000, good for cases that leader shortcuts dont work ║
║                              ║                                                                     ║
║ .                            ║ Auto compilation                                                    ║
║ :w!!                         ║ Vim sudo trick or :w !sudo tee > /dev/null %                        ║
║ <ctrl>o                      ║ Vim sudo trick or :w !sudo tee > /dev/null %   #force #write        ║
║ :red                         ║ Redo #redo                                                          ║
║ <ctrl>r                      ║ Reload (notifies if file has been changed) #reload                  ║
║ <ctrl-shift>r                ║ Force reload :e!<CR> #force #reload                                 ║
║ gx                           ║ In normal mode, if you stand on a link and enter `g` then `x`       ║
║                              ║    the link will be opened in a browser window #browser #link       ║
║                              ║                                                                     ║
║ <ctrl+a>                     ║ (Only in insert mode) brings rofi up and let you select an email    ║
║                              ║ from the address book and then inserts it at the prompt             ║
║                              ║                                                                     ║
╠════╣   vim file types   ╠════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ Associating to a filetype    ║ Add the following line to the begining or ending of the file:       ║
║                              ║     # vim:filetype=i3                                               ║
║                              ║                                                                     ║
║ Get list of available syntax ║ :setfiletype <tab>   (space is required before the tab)             ║
║                              ║ :echo getcompletion('', 'filetype')                                 ║
║                              ║ :echo getcompletion('c', 'filetype')                                ║
║                              ║                                                                     ║
╠════╣ installing plugins ╠════╬═════════════════════════════════════════════════════════════════════╣
║                              ║                                                                     ║
║ vim ~/.vimrc                 ║ edit vimrc and in the section which begins with: (circa 338)        ║
║                              ║    call plug#begin('~/.vim/plugged')                                ║
║                              ║    -->    Plug 'https://github.com/PotatoesMaster/i3-vim-syntax.git'║
║                              ║ or -->    Plug 'PotatoesMaster/i3-vim-syntax.git'  					  ║
║                              ║                                                                     ║
║                              ║ then inside vim run:                                                ║
║                              ║                                                                     ║
║                              ║    :PlugInstall                              or                     ║
║                              ║    :PlugUpdate                                                      ║
║                              ║                                                                     ║
╚══════════════════════════════╩═════════════════════════════════════════════════════════════════════╝

## Command line usage

to open several files in split mode use:

`vim -O *.txt`

or

`vim -O ~/.zshrc ~/zshrc.local.sh`

to enable plugin docs (help), you need to run

`:helptags ALL`

