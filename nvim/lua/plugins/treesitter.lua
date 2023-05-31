local M = {
  "nvim-treesitter/nvim-treesitter", -- syntax tree for better language features
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  event = { "BufReadPost", "BufNewFile" },
}

M.config = {
  highlight = {
    enable = true,
  },
  indent = { enable = true },
  -- enable autotagging (w/ nvim-ts-autotag plugin)
  autotag = { enable = true },
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "scss",
    "markdown",
    "svelte",
    "graphql",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
  },
  -- auto install above language parsers
  auto_install = true,
}

return M
