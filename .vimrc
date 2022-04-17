" Display line numbers
set number
set relativenumber

" Makes tabs equal to 4 spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Will auto indent the file
set autoindent

" Change the colorscheme. Colors are stored in ~/.vim/color
" Enable 256 colors
set t_Co=256
colorscheme monokai
syntax enable

syntax on
filetype plugin on

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

" Scroll when 8 off from top
set scrolloff=8

" Statusline
set laststatus=2
set cmdheight=2
set showmode
set showcmd
set statusline=%f%m%r%h%w[%L]

" OCaml
" let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
        
" Allow saving of files as sudo when I forget to start vim using sudo
cmap w!! w !sudo tee > /dev/null %

" Buffers
nnoremap <F2> :buffers<Cr>:b<Space>

" Tabs
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




