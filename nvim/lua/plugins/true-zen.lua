local M = {
  "Pocco81/true-zen.nvim", -- Zen mode
  enabled = true,
  cmd = { "TZAtaraxis", "TZNarrow", "TZFocus", "TZMinamalist" },
}

function M.config()
  -- import true-zen safely
  local true_zen_setup, true_zen = pcall(require, "true-zen")
  if not true_zen_setup then
    return
  end
  true_zen.setup()
end

return M
