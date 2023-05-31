-- Quit these files fast
vim.cmd([[
  augroup QuitFast
    autocmd!
    autocmd FileType Help nnoremap <C-c> :q!<CR>
    autocmd FileType Man nnoremap <C-c> :q!<CR>
    autocmd FileType NvimTree nnoremap <C-c> :q!<CR>
    autocmd FileType Trouble nnoremap <C-c> :q!<CR>
    autocmd FileType Aerial nnoremap <C-c> :q!<CR>
    autocmd FileType TelescopePrompt nnoremap <C-c> :q!<CR>
  augroup END
]])
