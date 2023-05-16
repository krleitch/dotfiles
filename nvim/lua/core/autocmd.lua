-- Quit these files fast
vim.cmd([[
  augroup QuitFast
    autocmd!
    autocmd FileType Help nnoremap <C-c> :q!<CR>
    autocmd FileType harpoon nnoremap <C-c> :q!<CR>
    autocmd FileType NvimTree nnoremap <C-c> :q!<CR>
    autocmd FileType TelescopePrompt nnoremap <C-c> :q!<CR>
    autocmd FileType vim-plug nnoremap <C-c> :q!<CR>
    autocmd FileType mind nnoremap <C-c> :q!<CR>
  augroup END
]])
