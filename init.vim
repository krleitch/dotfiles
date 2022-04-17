call plug#begin('~/.config/nvim/bundle')

    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

call plug#end()

" Import vim settings
set runtimepath^=-/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" colorscheme config
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

" Change colors
" let g:tokyonight_colors = {
"   \ 'hint': 'orange',
"   \ 'error': '#ff0000'
" \ }

 " Load the colorscheme
 colorscheme tokyonight
