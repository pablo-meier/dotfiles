"  Much of this taken from an insightful blog post (took long enough for
"  something like this):
"  http://nvie.com/posts/how-i-boosted-my-vim/

let mapleader=","
set nocompatible

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'wincent/Command-T'
Bundle 'wlangstroth/vim-racket'

" Check out later?
" Bundle Shougo/neocomplcache
" Bundle majutsushi/tagbar
" Bundle eagletmt/ghcmod-vim
" Bundle scrooloose/syntastic

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos

filetype plugin indent on 

set modelines=0
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
set hidden

" Mine.  Tabbers Gonna Tab.
set noexpandtab

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

