lua << EOF
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})
EOF

" maps
nnoremap <silent><leader>hh :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><leader>hq :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><leader>hw :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><leader>he :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><leader>hr :lua require("harpoon.ui").nav_file(4)<CR>
