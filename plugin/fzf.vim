if !exists('g:loaded_fzf_vim') | finish | endif

" show hidden files as well
nnoremap <silent> <C-p> :GFiles<CR>
" find only files in same directory as current buffer
nnoremap <silent> ff :GFiles <C-r>=expand("%:h")<CR>/<CR>
" show open buffers
nnoremap <silent> fb :Buffers<CR>
" git status
nnoremap <silent> fs :GFiles?<CR>
