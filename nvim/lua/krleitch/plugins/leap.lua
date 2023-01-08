-- import leap plugin safely
local leap_status, leap = pcall(require, "leap")
if not leap_status then
  return
end

leap.setup({
  highlight_unlabeled = true,
})
leap.set_default_keymaps()
