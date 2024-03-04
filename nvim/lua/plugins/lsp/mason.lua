-- Mason with lsp, null-ls
local M = {
  "williamboman/mason.nvim",
  enabled = true,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  event = "VeryLazy",
}

function M.config()
  require("mason").setup()

  require("mason-lspconfig").setup({
    ensure_installed = {
      "tsserver",
      "html",
      "cssls",
      "tailwindcss",
      "lua_ls",
      "emmet_ls",
      "rust_analyzer",
      "elixirls",
      "angularls",
      "gopls",
      "pyright",
      "svelte",
    },
  })

  require("mason-null-ls").setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {
      "prettier", -- ts/js formatter
      "stylua", -- lua formatter
      "eslint_d", -- ts/js linter
    },
    -- auto-install configured formatters & linters (with null-ls)
    automatic_installation = true,
  })
end

return M
