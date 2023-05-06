-- import harpoon plugin safely
local setup, harpoon = pcall(require, "harpoon")
if not setup then
  return
end

-- configure/enable harpoon
harpoon.setup()
