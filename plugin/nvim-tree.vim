lua << EOF

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  open_on_tab = false,
  remove_keymaps = false, -- I have had to manually remove the <TAB> .. fix sometime
  view = {
        side = "left",
        number = false,
        relativenumber = false,
        mappings = {
          list = {
            -- user mappings go here
            { key = "u", action = "dir_up" },
            { key = "e", action = "preview" },
          },
        },
      },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  }
})

EOF

nnoremap <leader>tt :NvimTreeToggle<CR>
nnoremap <leader>tf :NvimTreeFindFile<CR>
nnoremap <leader>tr :NvimTreeRefresh<CR>

