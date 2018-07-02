"""Weird tmux settings
let &t_Co=256

""" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/unite.vim'
Plug 'devjoe/vim-codequery'
call plug#end()

"""" General Settings
"" leader
let mapleader=","

"" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='jellybeans'

"" vim-codequery
nnoremap <leader>c :CodeQueryMenu Unite Full<CR>
nnoremap <leader>s :CodeQuery Symbol<CR>
nnoremap <leader>l :CodeQuery Call<CR>
nnoremap <leader>r :CodeQuery Caller<CR>
nnoremap <leader>e :CodeQuery Callee<CR>

"" Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

"" Stupid backspace setting
"set backspace=2

"" Remember location in file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"" Line numbers
set number

"" Autoindent
set autoindent

"" Colors
syntax enable
set background=dark
colorscheme gotham256
filetype plugin on

"" Ctags
set path+=;/
set tags+=c_tags;/
set tags+=tags;/
" By default ^W ^] splits horizontal, so now ^] splits vertically
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"" Window stuff
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"" Buffer Stuff
noremap <leader>d : bd<CR>
noremap <leader>1 : 1b<CR>
noremap <leader>2 : 2b<CR>
noremap <leader>3 : 3b<CR>
noremap <leader>4 : 4b<CR>
noremap <leader>5 : 5b<CR>
noremap <leader>6 : 6b<CR>
noremap <leader>7 : 7b<CR>
noremap <leader>8 : 8b<CR>
noremap <leader>9 : 9b<CR>
noremap <leader>10 : 10b<CR>
