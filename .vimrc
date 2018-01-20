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
colorscheme monokai-phoenix
syntax enable

syntax on
filetype plugin on

" Remaps
nnoremap j gj
nnoremap k gk

" Scroll when 8 off from top
set scrolloff=8

"OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
        
