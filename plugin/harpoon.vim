lua << EOF
require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
    }
})
EOF

" maps
nnoremap <silent><C-e>h :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e>q :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <silent><C-e>u :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><C-e>i :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><C-e>o :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><C-e>p :lua require("harpoon.ui").nav_file(4)<CR>
