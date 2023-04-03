-- call find_files if we can't find a git repo
-- used by alpha for a generic open files

local M = {}

M.project_files = function()
  local opts = { show_untracked = true } -- define here if you want to define something
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then
    require("telescope.builtin").find_files(opts)
  end
end

return M
