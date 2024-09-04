local M = {
  "nvim-treesitter/nvim-treesitter", -- syntax tree for better language features
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  event = { "BufReadPost", "BufNewFile" },
}

M.config = function()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    ensure_installed = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "elixir",
      "heex",
      "javascript",
      "html",
      "javascript",
      "typescript",
      "svelte",
      "css",
      "json",
      "scss",
    },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
