" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set tm=500
set nocompatible
scriptencoding utf8
let dotfilespath=fnamemodify(resolve($MYVIMRC),':h')
" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                        vim-plug                             ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
" #vp
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'https://github.com/PotatoesMaster/i3-vim-syntax.git'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'moll/vim-bbye'
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'https://github.com/mbbill/undotree.git'
" Plug 'vim-scripts/ZoomWin'
" Plug 'szw/vim-maximizer'
" NERD tree will be loaded on the first invocation of NERDTreeToggle command
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()




" Fixing ctrl-q or s not reaching to vim which is: enable XON/XOFF flow control
silent !stty -ixon > /dev/null 2>/dev/null
" ================ General Config ====================

set number								"Line numbers are good
set backspace=indent,eol,start	"Allow backspace in insert mode
set history=1000						"Store lots of :cmdline history
set showcmd								"Show incomplete cmds down the bottom
set showmode							"Show current mode down the bottom
set gcr=a:blinkon0					"Disable cursor blink
set visualbell							"No sounds
set autoread							"Reload files changed outside vim

set incsearch							"find the next match as we type the search

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden								"hide buffers when not displayed

"turn on syntax highlighting
syntax on

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=3
set softtabstop=3
set tabstop=3
set expandtab
"set noexpandtab
"filetype on
filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·
set list!

" ================ Folds ============================

set foldmethod=indent	"fold based on indent
set foldnestmax=3			"deepest fold is 3 levels
set nofoldenable			"dont fold by default

" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                          Completion                         ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
" #cl

set wildchar=<Tab>            " Key used to start command-line completion.
set wildmode=full             "make cmdline tab completion similar to bash
set wildmenu						"enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~	"stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.swp,*.un~   " Ignore vim's temporaries.
set wildignore+=*.cmo,*.cmi " Ignore OCaml's build artifacts
set wildignore+=*.pdf,*.dvi " Ignore prepared documents (common with LaTeX).
set wildignore+=*.class     " Ignore Java class files.
set wildignore+=*.hi        " Ignore Haskell interface files.
set wildignore+=*.pyc       " Ignore Python byte-code.
" ================ Scrolling ========================

set scrolloff=8			    "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                        Custom Settings                      ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
" #cs
execute pathogen#infect()
"Helptags

set t_co=256
let base16colorspace=256
"set term=xterm-256color
set term=$TERM
if has("win32")
	let s:uname = "win"
	so ~/vimfiles/settings.vim
	colorscheme slate
else
	so ~/.vim/settings.vim
	let g:solarized_termcolors=256
	if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
		so ~/.vim/mac.vim
	 elseif s:uname == "Linux\n"
		so ~/.vim/linux.vim
	 else
		colorscheme gruvbox
    endif
  endif
endif
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

" let g:airline_theme='gruvbox'
" let g:airline_theme='powerlineish'
let g:airline_theme='hybridline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_extensions = ['tabline','branch']
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = '  '
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '  '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = ' '
let g:airline_symbols.paste = ' ' "     
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

function! WindowNumber(...)
    let builder = a:1
    let context = a:2
    call builder.add_section('airline_b', '%{tabpagewinnr(tabpagenr())}')
    return 0
endfunction

call airline#add_statusline_func('WindowNumber')
call airline#add_inactive_statusline_func('WindowNumber')

function! Render_Only_File(...)
  let builder = a:1
  let context = a:2

  call builder.add_section('file', '!! %F')

  return 0   " the default: draw the rest of the statusline
  return -1  " do not modify the statusline
  return 1   " modify the statusline with the current contents of the builder
endfunction
call airline#add_inactive_statusline_func('Render_Only_File')

set ignorecase						"set search to be case insensitive
set smartcase						"unless you typed uppercase letters in your query
command ZZ w|execute "!git add --all && git commit -m updated && git push"
set colorcolumn=81
set laststatus=2
set background=dark
set listchars=tab:▸\ ,eol:¬
"set showbreak=…

" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                      Export all keymappings                 ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
" #ek
function ExportMap()
   redir! > /tmp/vim_maps.txt
   echomsg "# vim: set filetype=xkb :tw=14"
   silent map
   echomsg "# =================================================="
   echomsg "# =================================================="
   echomsg "# =================================================="
   silent map!
   normal q
   redir END
   e /tmp/vim_maps.txt
endfunction 

" ========= Configuring Fonts for gvim =======
if has("gui_running")
	if has("gui_gtk2")			" Linux
	 set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 12
	elseif has("gui_macvim")
	 set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 12
	elseif has("gui_win32")
	 set guifont=Inconsolata-g\ for\ Powerline\ Medium\ 12
	endif
else
	let g:AutoClosePreservDotReg = 0
endif

" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                  Extending wrap functionality               ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
" #tw
function ToggleWrap(show)
	if &wrap
		setlocal nowrap
		set virtualedit=all
		set columns=400
		silent! nunmap <buffer> <Up>
		silent! nunmap <buffer> <Down>
		silent! nunmap <buffer> <Home>
		silent! nunmap <buffer> <End>

		silent! iunmap <buffer> <Up>
		silent! iunmap <buffer> <Down>
		silent! iunmap <buffer> <Home>
		silent! iunmap <buffer> <End>
		if a:show
			echom "Wrap OFF"
		endif
	else
		setlocal wrap linebreak nolist
		set virtualedit=onemore
		setlocal display+=lastline
		set columns=81
		noremap	<buffer> <silent> <Up>		gk
		noremap	<buffer> <silent> <Down>	gj
		noremap	<buffer> <silent> <Home>	g<Home>
		noremap	<buffer> <silent> <End>		g<End>
		noremap  <buffer> <silent> k gk
		noremap  <buffer> <silent> j gj
		noremap  <buffer> <silent> 0 g0
		noremap  <buffer> <silent> $ g$
		inoremap <buffer> <silent> <Up>	 <Esc>gk
		inoremap <buffer> <silent> <Down> <Esc>gj
		inoremap <buffer> <silent> <Home> <C-o>g<Home>
		inoremap <buffer> <silent> <End>  <C-o>g<End>
		if a:show
			echom "Wrap ON"
		endif
	endif
endfunction


" echomsg "# vim: set filetype=xkb :tw=14"
noremap <silent> <Leader>w :call ToggleWrap(1)<CR>
"call ToggleWrap(0)
"call ToggleWrap(0)

set hlsearch

" =============   Mouse Options  ===============
set mouse=
set ttymouse=xterm2
" =============     Vimdiff      ===============
set equalalways
"set columns=80
"if &diff
"	let &columns = ((&columns*2 > 172)? 172: &columns*2)
"else
"endif

" =============  Split Options   ===============
set splitright


" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                  Final and custom mappings                  ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
"
"     ** Don't do it here add it to ~/.vim/settings.vim **
"
" ═════════════════════════════════════════════════════════════

" sneak clever mode on
let g:sneak#s_next = 1

" Help in vertical mode
" :cabbrev h vert h                    " This is an alternate solution
autocmd FileType help wincmd L         " Open h/help vertically
autocmd FileType h    wincmd L

" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                undotree configuration                       ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝

let g:undotree_WindowLayout = 2
let g:undotree_SplitWidth = 30
let g:undotree_DiffpanelHeight = 10
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_TreeNodeShape = ''
let g:undotree_DiffCommand = "diff -u"


" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                neocomplete and neosnippet                   ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝

" Enable neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"





" ╔═════════════════════════════════════════════════════════════╗
" ║                                                             ║
" ║                        TComment                             ║
" ║                                                             ║
" ╚═════════════════════════════════════════════════════════════╝
" #tc
"
" map ctrl+/ for toggle/untoggle comments
nmap <C-_>     <Plug>TComment_gcc
vmap <C-_>     <Plug>TComment_gc

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" disable conceallevel for json filetypes
autocmd FileType json set conceallevel=0

let g:neosnippet#snippets_directory='~/.vim/snippets'
let g:neosnippet#disable_runtime_snippets= { '_' : 1, }
" ============ Final Settings =================
set nowrap
set novb
set noeb
set nonumber
" change color formatting of line numbers
highlight LineNr ctermfg=DarkGrey ctermbg=NONE guifg=Grey70 guibg=Grey22 cterm=bold
"au BufNewFile,BufRead *.yaml,*.yml so dotfilespath/vim/bundle/syntax/YAML.vim

" Quicky preivew and switch themes
so ~/.vim/preview-scheme.vim

let g:load_doxygen_syntax=1
let g:doxygen_enhanced_color=1
let doxygen_my_rendering=1

" We need to reload airline theme manually after colorscheme change
autocmd FileType symbol colorscheme babymate256 | call airline#load_theme()


" set t_ks=
" set t_ti=
"
" let &t_Co=256
" let &t_8b="\<Esc>[48:2:%lu:%lu:%lum" 
" let &t_8f="\<Esc>[38:2:%lu:%lu:%lum"                                  
"let &t_Co=256
"let &t_AB="[48;5;%dm"
"let &t_AF="[38;5;%dm

" Enable clipboard copy on remote sessions
" Remember to turn on X-Forwarding in /etc/ssh/ssh_config
" ForwardX11 yes
vmap "+y :!xclip -f -selection c<cr>

