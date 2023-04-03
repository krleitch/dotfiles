-- import nvim-tree plugin safely
local setup, colorizer = pcall(require, "colorizer")
if not setup then
  return
end

colorizer.setup({
  "css",
})
