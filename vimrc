"""Weird tmux settings
let &t_Co=256

""" Load plugins
call plug#begin('~/.vim/plugged')
Plug 'whatyouhide/vim-gotham'
call plug#end()

"""" General Settings
"" Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
"
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

"" Fuzzy Finding
set path+=**
set wildmenu

"" Window stuff
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
