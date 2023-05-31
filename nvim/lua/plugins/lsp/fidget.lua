local M = {
  "j-hui/fidget.nvim", -- show lsp loading status
  enabled = true,
  event = "VeryLazy",
}

M.config = {
  window = {
    relative = "win", -- where to anchor, either "win" or "editor"
    blend = 0, -- &winblend for the window
    zindex = nil, -- the zindex value for the window
  },
}

return M
