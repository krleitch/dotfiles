local M = {
  "lukas-reineke/indent-blankline.nvim", -- show indent lines
  main = "ibl",
  opt = {},
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
}

M.config = {}

return M
