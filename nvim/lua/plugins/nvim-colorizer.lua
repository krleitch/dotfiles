local M = {
  "norcalli/nvim-colorizer.lua", -- show hex and rgb colors in buffer
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },
}

M.config = {
  -- only show by default in css files
  "css",
}

return M
