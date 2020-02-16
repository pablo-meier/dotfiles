"  Much of this taken from an insightful blog post (took long enough for
"  something like this):
"  http://nvie.com/posts/how-i-boosted-my-vim/
"  https://alex.dzyoba.com/blog/vim-revamp/

let mapleader=","
set nocompatible

" Using vim-plug these days...
call plug#begin()

" Language-agnostic
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Language-specific
Plug 'nathangrigg/vim-beancount'
Plug 'tpope/vim-markdown'
Plug 'nvie/vim-flake8'
Plug 'elixir-editors/vim-elixir'
Plug 'wlangstroth/vim-racket'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'copy/deoplete-ocaml'

call plug#end()

set modelines=0
set hidden


set expandtab
set nohlsearch
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
set ignorecase

set history=1000
set undolevels=1000
set wildignore=*.smp,*.bak,*.class,*.o
set title

set number

noremap gb gT
noremap k gk
noremap j gj

" Leader time
"
" Edit your .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
" Reload .vimrc
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" open file finder - F
nmap <Leader>f :Files<CR>
" Go to definition - B
nmap <Leader>b :ALEGoToDefinition<CR>
" Symbol Search - E
nmap <Leader>e :ALESymbolSearch<CR>
" ALE errors quickly with Ctrl J and K
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Get type of expression
nmap <Leader>t :MerlinTypeOf<CR>

set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_linters = {}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1

let g:ale_fixers.elixir = ['mix_format']
let g:ale_linters.elixir = ['elixir-ls', 'credo']
let g:ale_elixir_elixir_ls_release = '~/projects/git_clones/elixir-ls/rel'

let g:deoplete#enable_at_startup = 1

let g:syntastic_ocaml_checkers = ['merlin']

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
