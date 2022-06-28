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

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs),
'!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/bundle')
Plug 'Valloric/YouCompleteMe'  
Plug 'morhetz/gruvbox'
Plug 'roxma/vim-tmux-clipboard'
call plug#end()

set background=dark
colorscheme gruvbox
let g:grvbox_contrast_dark='default'
