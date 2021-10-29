" Display line numbers
set number

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

nnoremap <F2> :buffers<Cr>:b<Space>
