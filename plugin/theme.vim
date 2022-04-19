" colorscheme config
" tokyo night
" let g:tokyonight_style = 'night'
" let g:tokyonight_italic_functions = 1
" let g:tokyonight_sidebars = [ 'qf', 'vista_kind', 'terminal', 'packer' ]
" Change colors
" let g:tokyonight_colors = {
"   \ 'hint': 'orange',
"   \ 'error': '#ff0000'
" \ }

" catppuccin
lua << EOF
local catppuccin = require("catppuccin")
-- configure it
catppuccin.setup()
EOF

" Load the colorscheme
" colorscheme tokyonight
colorscheme catppuccin
