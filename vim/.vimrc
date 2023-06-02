" ---------------------------------------
" OPTIONS
" ---------------------------------------

set nocompatible

" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" matchit.vim is built-in so enable it 
runtime macros/matchit.vim

" Fundamental settings
set title "show the title at top
set backspace=indent,eol,start "make backspace work like normal
set ruler "show line position in bottom right
set hidden "hide file buffers
set ttyfast "speed up typing
set exrc "use local .vimrc if exists 
set guicursor= "keep cursor as block
set noerrorbells "remove error bells

" line numbers
set number
set relativenumber
set scrolloff=8 "scroll before at top or bottom

" searching
set hlsearch "highlight search results
set incsearch "show results while typing
set ignorecase "search results ignore case
set smartcase "if you search with one or more uppercase then case matters

" tabs and spaces 
set expandtab "convert tabs to spaces
set tabstop=2 "the number of spaces
set softtabstop=2 "insert and delete correct number of spaces
set shiftwidth=2 "spaces for indentation
set autoindent "let vim auto indent new lines

" use undofile over swaps
set noswapfile
set nobackup
if !has('nvim')
  set undodir=~/.vim/undodir
endif
if has('nvim')
  set undodir=~/.config/nvim/undodir
endif
set undofile

" statusline
set laststatus=2 "always show last status
set cmdheight=1
set showmode
set showcmd
set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" finding files - Search down into subfolders
set wildmode=longest,list,full
set wildmenu
set path+=**
set wildignore+=*/node_modules/*

" color
set termguicolors
set background=dark

" Change the colorscheme. Colors are stored in ~/.vim/color
if !has('nvim')
  colorscheme monokai
endif

" ---------------------------------------
" MAPS
" ---------------------------------------

nnoremap <SPACE> <Nop>
let mapleader=" "

inoremap jj <ESC>

" multi line alts as default
nnoremap j gj
nnoremap k gk

" Insert mode go to end and start
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

" Make Y work like D and C instead of just being yy
map Y y$

" re-source vim without restarting
nnoremap <leader>sv :source $MYVIMRC<CR>

" tabs
nnoremap <leader>te :tabnew %<cr>
nnoremap <leader>tx :tabclose<cr>
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" splits
nnoremap <leader>sv <C-w>v
nnoremap <leader>sh <C-w>s
nnoremap <leader>sx :close<cr>
nnoremap <leader>se <C-w>=

" use [[ ]] ][ [] when not in first column
map [[ :silent! eval search('{', 'b')<CR>w99[{
map ][ :silent! eval search('}')<CR>b99]}
map ]] j0[[%:silent! eval search('{')<CR>
map [] k$][%:silent! eval search('}', 'b')<CR>

" jump to the previous function
nnoremap <silent> [f :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "bw")<CR>
" jump to the next function
nnoremap <silent> ]f :call
\ search('\(\(if\\|for\\|while\\|switch\\|catch\)\_s*\)\@64<!(\_[^)]*)\_[^;{}()]*\zs{', "w")<CR>

" clear highlighting
nnoremap <leader>nh :noh<CR>

" Allow saving of files as sudo when I forget to start vim using sudo
" doesnt work in neovim
cmap w!! w !sudo tee > /dev/null %

" macro over visual range
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" quick norm modes
vnoremap <leader>n :'<,'>norm

" buffers
nnoremap <leader>fb :buffers<Cr>:b<Space>
" last used buffer
nnoremap <leader>ga :e#<Cr>

" ---------------------------------------
" BUFFERS
" ---------------------------------------

" delete all buffers but current one
command! Bo execute '%bdelete|edit#|bdelete#|normal `"'

" Search for buffers by name with partial matchings
function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

"Bind the BufSel function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")( 
