noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

syntax on
set exrc
set guicursor=
set relativenumber
set number
set nohlsearch
set hidden
set expandtab
set noerrorbells
set tabstop=4 shiftwidth=4
set shiftwidth=4
set smartindent
set nowrap
set smarttab
set nobackup
set undodir=~/.vim/undodir
set undofile
set noswapfile
set incsearch
set autochdir
set termguicolors
set scrolloff=8
set colorcolumn=80
set signcolumn=yes

set cmdheight=2

set updatetime=50

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/bundle')
Plug 'Valloric/YouCompleteMe'  
Plug 'morhetz/gruvbox'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'roxma/vim-tmux-clipboard'
call plug#end()

set background=dark
colorscheme gruvbox
let g:grvbox_contrast_dark='default'
