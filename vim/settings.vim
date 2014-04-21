" ================ Tabularize =====================
"if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
"endif

" ================ Unimpaired =====================
    map <Leader><Leader> <C-^>

    "copy/paste mappings
    noremap <leader>y "*y
    noremap <leader>yy "*Y
    noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>"

    "map up/down arrow keys to unimpaired commands
    nmap <Up> [e
    nmap <Down> ]e
    vmap <Up> [egv
    vmap <Down> ]egv

    "map left/right arrow keys to indendation
    nmap <Left> <<
    nmap <Right> >>
    vmap <Left> <gv
    vmap <Right> >gv

    noremap <Leader>/ :nohls<CR>

    nnoremap <Tab>h <C-w>h
    nnoremap <Tab>j <C-w>j
    nnoremap <Tab>l <C-w>l
    nnoremap <Tab>k <C-w>k

    inoremap jj <Esc><Esc>
    inoremap jk <Esc><Esc>
    inoremap kj <Esc><Esc>
