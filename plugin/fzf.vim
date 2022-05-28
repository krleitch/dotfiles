if !exists('g:loaded_fzf_vim') | finish | endif

" show hidden files as well
nnoremap <silent> <C-p> :GFiles<CR>
" find only files in same directory as current buffer
nnoremap <silent> <leader>ff :GFiles <C-r>=expand("%:h")<CR>/<CR>
" show open buffers
nnoremap <silent> <leader>fb :Buffers<CR>
" git status
nnoremap <silent> <leader>fs :GFiles?<CR>
" Rg
nnoremap <silent> <leader>fg :Rg<CR>
" find in open buffer
nnoremap <silent> <leader>fc :BLines<CR>

