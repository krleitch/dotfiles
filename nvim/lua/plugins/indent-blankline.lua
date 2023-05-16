local M = {
  "lukas-reineke/indent-blankline.nvim", -- show indent lines
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
}

function M.config()
  -- import indent_blankline plugin safely
  local setup, indent_blankline = pcall(require, "indent_blankline")
  if not setup then
    return
  end

  indent_blankline.setup({
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = false,
  })
end

return M
