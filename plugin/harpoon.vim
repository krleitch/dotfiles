lua << EOF
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})
EOF

" maps
nnoremap <silent>gq :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

" mapping nums may not be portable
nnoremap <silent>g1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent>g2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent>g3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent>g4 :lua require("harpoon.ui").nav_file(4)<CR>
