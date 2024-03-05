local M = {
  "lewis6991/gitsigns.nvim", -- show git signs in sign column
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },
}

M.config = {}

return M
