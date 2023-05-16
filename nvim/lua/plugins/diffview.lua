local M = {
  "sindrets/diffview.nvim", -- see git diffs side by side
  enabled = true,
  event = "VeryLazy",
}

function M.config()
  -- import diffview safely
  local diffview_status, diffview = pcall(require, "diffview")
  if not diffview_status then
    return
  end

  diffview.setup()
end

return M
