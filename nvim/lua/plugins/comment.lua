local M = {
  "numToStr/Comment.nvim",
  enabled = true,
  event = "VeryLazy",
}

function M.config()
  local comment_setup, comment = pcall(require, "Comment")
  if not comment_setup then
    return
  end

  comment.setup()
end

return M
