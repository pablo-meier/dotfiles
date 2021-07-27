"  Much of this taken from an insightful blog post (took long enough for
"  something like this):
"  http://nvie.com/posts/how-i-boosted-my-vim/
"  https://alex.dzyoba.com/blog/vim-revamp/

let mapleader=","
set nocompatible

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
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
" Reload .vimrc
nmap <silent> <Leader>sv :so $MYVIMRC<CR>

call plug#begin()

" Language-agnostic
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'elixir-lsp/elixir-ls', {'do': { -> g:ElixirLS.compile()}}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-signify'

" Language-specific
Plug 'nathangrigg/vim-beancount'
Plug 'tpope/vim-markdown'
Plug 'nvie/vim-flake8'
Plug 'elixir-editors/vim-elixir'
Plug 'wlangstroth/vim-racket'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

highlight CocErrorFloat ctermfg=Black
highlight SignifySignAdd ctermbg=28
highlight SignifySignChange ctermbg=18
let g:signify_sign_change = '>'

" <TAB> and <S-TAB> to cycle through results, <CR> to select one.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Don't autocomplete on `end` in Elixir (makes it hard to line break)
autocmd FileType elixir let b:coc_suggest_blacklist = ["end"]

" Go to diagnostics easily
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Go to definition
nmap <silent> gd <Plug>(coc-definition)
" Type definition
nmap <silent> gy <Plug>(coc-type-definition)
" Type definition
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


let g:coc_global_extensions = ['coc-elixir', 'coc-python', 'coc-diagnostic']

let g:ElixirLS = {}
let ElixirLS.path = stdpath('config').'/plugged/elixir-ls'
let ElixirLS.lsp = ElixirLS.path.'/release/language_server.sh'
let ElixirLS.cmd = join([
        \ 'asdf install &&',
        \ 'mix do',
        \ 'local.hex --force --if-missing,',
        \ 'local.rebar --force,',
        \ 'deps.get,',
        \ 'compile,',
        \ 'elixir_ls.release'
        \ ], ' ')

function ElixirLS.on_stdout(_job_id, data, _event)
  let self.output[-1] .= a:data[0]
  call extend(self.output, a:data[1:])
endfunction

let ElixirLS.on_stderr = function(ElixirLS.on_stdout)

function ElixirLS.on_exit(_job_id, exitcode, _event)
  if a:exitcode[0] == 0
    echom '>>> ElixirLS compiled'
  else
    echoerr join(self.output, ' ')
    echoerr '>>> ElixirLS compilation failed'
  endif
endfunction

function ElixirLS.compile()
  let me = copy(g:ElixirLS)
  let me.output = ['']
  echom '>>> compiling ElixirLS'
  let me.id = jobstart('cd ' . me.path . ' && git pull && ' . me.cmd, me)
endfunction

call coc#config('elixir', {
  \ 'command': g:ElixirLS.lsp,
  \ 'filetypes': ['elixir', 'eelixir']
  \})
call coc#config('elixir.pathToElixirLS', g:ElixirLS.lsp)


" open file finder - F
nmap <Leader>f :Files<CR>
set completeopt=menu,menuone,preview,noselect,noinsert
let g:LanguageClient_serverCommands = {
    \ 'python': ['/Users/pablo/ycard/suma-core/env/bin/pyls'],
    \ }
