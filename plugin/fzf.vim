if !exists('g:loaded_fzf_vim') | finish | endif

nnoremap <C-p> :GFiles<CR>

" Bottom mode
"let g:fzf_layout = { 'down': '40%' }

" Window Mode
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" find only files in same directory as current buffer
nnoremap <silent> ff :GFiles <C-r>=expand("%:h")<CR>/<CR>
" show git files that edited
nnoremap <silent> fg :GF?<CR>
" show open buffers
nnoremap <silent> fb :Buffers<CR>
