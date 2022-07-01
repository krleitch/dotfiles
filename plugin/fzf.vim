if !exists('g:loaded_fzf_vim') | finish | endif

" use lightspeed for most things so dont need f

" show hidden files as well
nnoremap <silent> ff :GFiles<CR>
" find only files in same directory as current buffer
nnoremap <silent> fd :GFiles <C-r>=expand("%:h")<CR>/<CR>
" show open buffers
nnoremap <silent> fb :Buffers<CR>
" git status
nnoremap <silent> fs :GFiles?<CR>
" Rg
nnoremap <silent> fg :Rg<CR>
" find in open buffer
nnoremap <silent> fc :BLines<CR>

