-- import diffview plugin safely
local diffview_status, diffview = pcall(require, "diffview")
if not diffview_status then
  return
end

diffview.setup()
