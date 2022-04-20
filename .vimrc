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
"set statusline=%f%m%r%h%w[%L]
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
colorscheme monokai
syntax on
filetype plugin indent on

" Remaps
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $

" Cursor movement while in insert mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

inoremap jj <ESC>

" OCaml
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute 'set rtp+=' . g:opamshare . '/merlin/vim'
        
" Allow saving of files as sudo when I forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Buffers
nnoremap <F2> :buffers<Cr>:b<Space>
" next buffer
nnoremap <Leader>f :bn<Cr>
" previous buffer
nnoremap <Leader>b :bp<Cr>
" last used buffer
nnoremap <Leader>g :e#<Cr>
" list buffers
nnoremap <Leader>l :ls<Cr>

" Ngb for N = [1,99] for switching to that buffer
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile

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

"Bind the BufSel) function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")( 

" Tabs
"
" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Custom tabline with nerd font
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'
    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSep#'
    elseif i + 2 == tabpagenr()
      let s .= '%#TabLineSep2#'
    else
      let s .= ''
    endif
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999X'
 endif
  return s
endfunction
function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let name = bufname(buflist[winnr - 1])
  let label = fnamemodify(name, ':t')
  return len(label) == 0 ? '[No Name]' : label
endfunction
set tabline=%!MyTabLine() 

" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

