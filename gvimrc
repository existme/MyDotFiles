" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

set ch=2	    	" Make command line two lines high
set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

let c_comment_strings=1   " I like highlighting strings inside C comments
syntax on
set hlsearch              " Switch on search pattern highlighting.

" For Win32 version, have "K" lookup the keyword in a help file
"if has("win32")
"  let winhelpfile='windows.hlp'
"  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
"endif

" Set nice colors
" background for normal text is light grey
" Text below the last line is darker grey
" Cursor is green, Cyan when ":lmap" mappings are active
" Constants are not underlined but have a slightly lighter background
set gfn=Inconsolata-g\ for\ Powerline\ Medium\ 12
highlight Normal guibg=grey90
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=grey95
highlight Special gui=NONE guibg=grey95
colorscheme slate
colorscheme devbox-dark-256
highlight Cursor guibg=Green guifg=NONE
highlight lCursor guibg=Cyan guifg=NONE
