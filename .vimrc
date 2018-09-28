"  Much of this taken from an insightful blog post (took long enough for
"  something like this):
"  http://nvie.com/posts/how-i-boosted-my-vim/

let mapleader=","

set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required! 
Plugin 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'wlangstroth/vim-racket'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'elixir-editors/vim-elixir'

" Check out later?
" Bundle Shougo/neocomplcache
" Bundle majutsushi/tagbar
" Bundle eagletmt/ghcmod-vim

Plugin 'scrooloose/syntastic'

" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" non github repos

call vundle#end()
filetype plugin indent on 

set modelines=0
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
set hidden

" Mine.  Tabbers Gonna Tab.
set expandtab

syntax enable
filetype indent on
set tabstop=4
set autoindent
set copyindent
set background=dark
set shiftwidth=4
set autowrite
set laststatus=2
set statusline=%t\ %y\ format:\ %{&ff};\ [%l,%c]
" set textwidth=80
set ignorecase

set number

noremap gb gT
noremap k gk
noremap j gj

set history=1000
set undolevels=1000
set wildignore=*.smp,*.bak,*.class,*.o
set title

let g:syntastic_ocaml_checkers = ['merlin']
