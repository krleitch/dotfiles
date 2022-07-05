lua << EOF
require('auto-session').setup {
  log_level = 'info',
  auto_session_suppress_dirs = {'~/', '~/Documents/repos'},
  auto_restore_enabled = false,
  -- close lua tree and aerial
  pre_save_cmds = {"tabdo NvimTreeClose", "tabdo AerialClose"}
}
EOF
