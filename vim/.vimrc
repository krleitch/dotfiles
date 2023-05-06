set nocompatible "nvim is always nocompatible

" ---------------------------------------
" OPTIONS
" ---------------------------------------

" matchit.vim is built-in so enable it 
runtime macros/matchit.vim

" Fundamental settings
set title "show the title at top
set scrolloff=8 "scroll before at top or bottom
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

" true color
syntax enable
filetype plugin indent on
set t_Co=256
set termguicolors
set background=dark

" Change the colorscheme. Colors are stored in ~/.vim/color
if !has('nvim')
  colorscheme monokai
endif

" ---------------------------------------
" MAPS
" ---------------------------------------

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

" run through camelCase characters better
" generally use sneak or f/t for this in singlue use. use meta in rare case
nnoremap <silent><M-b> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><M-w> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><M-b> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><M-w> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

" add a new line above or below without leaving insert mode with repeat
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" tabs
nnoremap <leader>te :tabnew %<cr>
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

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
nnoremap <space><space> :noh<CR>

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
vnoremap <space>n :'<,'>norm

" buffers
nnoremap <F2> :buffers<Cr>:b<Space>
" last used buffer
nnoremap ga :e#<Cr>

" ---------------------------------------
" BUFFERS
" ---------------------------------------

" delete all buffers but current one
command! Bonly execute '%bdelete|edit#|bdelete#|normal `"'
command! BOnly execute '%bdelete|edit#|bdelete#|normal `"'
command! Bo execute '%bdelete|edit#|bdelete#|normal `"'
command! BO execute '%bdelete|edit#|bdelete#|normal `"'

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
