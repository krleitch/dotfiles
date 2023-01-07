-- import auto-session safely
local autosession_setup, autosession = pcall(require, "auto-session")
if not autosession_setup then
  return
end

autosession.setup({
  log_level = "info",
  auto_session_suppress_dirs = { "~/", "~/Documents/repos" },
  auto_restore_enabled = false,
  -- close nvim tree and aerial
  pre_save_cmds = { "tabdo NvimTreeClose", "tabdo AerialClose" },
})
