set incsearch nohlsearch
set isfname-==
set nottybuiltin
set shortmess=acTOI
set showcmd
set sidescroll=4
set splitbelow
set switchbuf=useopen
set t_Co=256
set belloff=all
set updatetime=1000
set viminfo+=!
set mouse=a
set maxmempattern=2000000
set smoothscroll
set display=lastline
set sessionoptions-=options

" Editing
set complete=.,w,b,k
set completeopt=menuone,popuphidden
set formatoptions=croqn
set nojoinspaces

" View formatting
set ruler
set diffopt+=vertical,iwhite,algorithm:patience,indent-heuristic
set linebreak showbreak=+
set listchars=eol:.,tab:\|-
set laststatus=2
set cursorlineopt=number,screenline

set statusline=
set statusline+=%<%f\ %h%m%r             " filename and flags
if exists('fugitive#Statusline')
  set statusline+=%{fugitive#Statusline()} " git info
endif
set statusline+=%=                       " alignment separator
set statusline+=[%{&ft}]                 " filetype
set statusline+=%-14.([%l/%L],%c%V%)     " cursor info

" Files
set autoread autowrite
set encoding=utf-8
set ffs=unix
set nobackup nowritebackup noswapfile
if has('persistent_undo')
  set undodir=~/.vimundo
  set undofile
endif

" Indentation
set backspace=indent,eol,start
set autoindent
set expandtab smarttab
set tabstop=8 softtabstop=2
set shiftwidth=2 shiftround
set cinoptions+=:0

" Command-line
set cmdheight=1
set wildmenu
set wildmode=list:longest,full
set wildoptions=pum,fuzzy

" Timeouts
set ttimeout
set ttimeoutlen=50

let mapleader="_"
let maplocalleader=","
