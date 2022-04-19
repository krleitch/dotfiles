if !exists('g:loaded_fzf_vim') | finish | endif

nnoremap <C-p> :GFiles<CR>

" Bottom mode
"let g:fzf_layout = { 'down': '40%' }

" Window Mode
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

