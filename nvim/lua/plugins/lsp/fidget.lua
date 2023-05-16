local M = {
  "j-hui/fidget.nvim",
  enabled = true,
  event = "VeryLazy",
}

function M.config()
  local fidget_setup, fidget = pcall(require, "fidget")
  if not fidget_setup then
    return
  end

  fidget.setup({
    window = {
      relative = "win", -- where to anchor, either "win" or "editor"
      blend = 0, -- &winblend for the window
      zindex = nil, -- the zindex value for the window
    },
  })
end

return M
