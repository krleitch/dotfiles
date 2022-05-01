" Display line numbers
set number
set relativenumber

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

" Fundamental settings
set title "show the title at top
set scrolloff=8 "scroll before at top or bottom
set backspace=indent,eol,start "make backspace work like normal
set ruler "show line position in bottom right
set hidden "hide file buffers
"highlight cursor line only on active window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" searching
set hlsearch "highlight search results
set incsearch "show results while typing
set ignorecase "search results ignore case
set smartcase "if you search with one or more uppercase then case matters

" Makes tabs equal to 2 spaces
set expandtab "convert tabs to spaces
set tabstop=2 "the number of spaces
set softtabstop=2 "insert and delete correct number of spaces
set shiftwidth=2 "spaces for indentation
set autoindent "let vim auto indent new lines

" Statusline
set laststatus=2 "always show last status
set cmdheight=1
set showmode
set showcmd
set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Finding files - Search down into subfolders
set wildmenu
set path+=**
set wildignore+=*/node_modules/*

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
endif

" Change the colorscheme. Colors are stored in ~/.vim/color
if !has('nvim')
  colorscheme monokai
endif

syntax on
filetype plugin indent on

" Imports
source ~/dotfiles/vim/maps.vim
source ~/dotfiles/vim/languages.vim
source ~/dotfiles/vim/buffers.vim
source ~/dotfiles/vim/tabs.vim
source ~/dotfiles/vim/windows.vim

