local M = {
  "stevearc/aerial.nvim", -- symbol tree
  enabled = true,
  cmd = { "AerialToggle", "AerialOpen", "AerialOpenAll" },
}

function M.config()
  -- import aerial safely
  local aerial_setup, aerial = pcall(require, "aerial")
  if not aerial_setup then
    return
  end

  aerial.setup()
end

return M
