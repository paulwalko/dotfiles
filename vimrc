""" Start vim.plug
execute pathogen#infect()


""" Syntastic
" Recommended settings
set statusline+=%#warning#
set statusline+=${SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""" General Settings
" Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Remember location in file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Line numbers
set number
set relativenumber

" Syntax highlighting
syntax enable
filetype plugin on

" Fuzzy Finding
set path+=**
set wildmenu


""" NOTES:
" AUTOCOMPLETE:
" - ^x^n for JUST this file
" - ^x^f for filenames
" - ^n for anything specified by the 'complete' option
