lua << EOF
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_tab = false,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tn :NvimTreeFindFile<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>

