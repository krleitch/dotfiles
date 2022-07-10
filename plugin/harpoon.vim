lua << EOF
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})
EOF

" maps
nnoremap <silent>fh :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <silent>fq :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent>fw :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent>fe :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent>fr :lua require("harpoon.ui").nav_file(4)<CR>
