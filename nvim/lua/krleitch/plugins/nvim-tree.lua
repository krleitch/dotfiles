-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- configure nvim-tree
nvimtree.setup({
  update_focused_file = { enable = true },
  hijack_cursor = true,
  view = {
    side = "left",
    number = false,
    relativenumber = false,
    cursorline = false,
    auto_resize = true,
    mappings = {
      list = {
        -- user mappings go here
        { key = "u", action = "dir_up" },
        { key = "e", action = "preview" },
      },
    },
  },
  renderer = {
    icons = {
      webdev_colors = true,
      git_placement = "before",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = false,
        modified = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  -- disable window_picker
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
