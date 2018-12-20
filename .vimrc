let mapleader=','
set nocompatible
filetype off

"Vundle begin
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Auto-Pairs'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"Vundle end
set incsearch
set clipboard=unnamedplus
syntax on 
set nu
set hlsearch
set autoindent
set laststatus=2
set mouse=a
let g:airline_powerline_fonts=1
let g:airline_theme='angr'
