lua << EOF
require'mind'.setup({
  keymaps = {
    normal = {
      ["<tab>"] = "nil",
      ["e"] = "toggle_node",
    },
    selection = {
      ["<tab>"] = "nil",
      ["e"] = "toggle_node",
    },
  }
})
EOF
