noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

syntax on
set number
set relativenumber
set expandtab
set tabstop=4 shiftwidth=4
set smarttab
set autoindent
set ignorecase
set smartcase
set autochdir
set autowrite
execute pathogen#infect()

filetype plugin indent on
let g:airline_powerline_fonts=1
