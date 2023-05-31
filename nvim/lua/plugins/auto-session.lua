local M = {
  "rmagatti/auto-session", -- save the last session automatically
  enabled = true,
  event = "VeryLazy",
}

M.config = {
  log_level = "info",
  auto_session_suppress_dirs = { "~/", "~/Documents/repos" },
  auto_restore_enabled = false,
  -- close nvim tree, aerial, trouble
  pre_save_cmds = { "tabdo NvimTreeClose", "tabdo AerialClose", "tabdo TroubleClose" },
}

return M
