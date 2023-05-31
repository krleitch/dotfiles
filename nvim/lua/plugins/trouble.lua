local M = {
  "folke/trouble.nvim", -- show diagnostics together with its own ui
  enabled = true,
  cmd = { "Trouble", "TroubleToggle" },
}

M.config = {
  signs = {
    error = " ",
    warning = " ",
    hint = " ",
    information = " ",
    other = " ",
  },
}

return M
