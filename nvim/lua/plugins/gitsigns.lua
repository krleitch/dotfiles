local M = {
  "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
  enabled = true,
  event = { "BufReadPost, BufNewFile" },
}

function M.config()
  require("gitsigns").setup()
end

return M
