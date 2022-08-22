lua << EOF
require'mind'.setup({
  keymaps = {
    normal = {
      ["<cr>"] = "open_data",
      t = "toggle_node",
      ["/"] = "select_path",
      I = "add_inside_start",
      i = "add_inside_end",
      d = "delete",
      O = "add_above",
      o = "add_below",
      q = "quit",
      r = "rename",
      R = "change_icon",
      u = "make_url",
      x = "select",
    },
    selection = {
      ["<cr>"] = "open_data",
      t = "toggle_node",
      ["/"] = "select_path",
      I = "move_inside_start",
      i = "move_inside_end",
      O = "move_above",
      o = "move_below",
      q = "quit",
      x = "select",
    }
  }
})
EOF
