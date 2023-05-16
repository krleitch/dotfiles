local M = {
  "folke/todo-comments.nvim", -- show diagnostics
  enabled = true,
  event = "VeryLazy",
}

function M.config()
  -- import todo-comments plugin safely
  local todo_comments_status, todo_comments = pcall(require, "todo-comments")
  if not todo_comments_status then
    return
  end

  todo_comments.setup()
end

return M
