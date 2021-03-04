set nocompatible		" required
filetype off			" required

" https://github.com/VundleVim/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme elflord
"filetype plugin indent off
set formatoptions=tcq
set hlsearch
set number
set ruler
set shiftwidth=4
set showmode
set showmatch
set tabstop=4
set visualbell
syntax on

autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
autocmd FileType * set tabstop=5|set shiftwidth=5|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"YAML files from redhad ansible doc (page 62)
autocmd FileType yaml setlocal ai ts=2 sw=2 et
