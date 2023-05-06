-- speed up start time
pcall(require, "impatient")

require("krleitch.plugins-setup")

-- core
require("krleitch.core.options")
require("krleitch.core.keymaps")
require("krleitch.core.colorscheme")

-- plugins
require("krleitch.plugins.comment")
require("krleitch.plugins.nvim-tree")
require("krleitch.plugins.lualine")
require("krleitch.plugins.telescope")
require("krleitch.plugins.nvim-cmp")
require("krleitch.plugins.autopairs")
require("krleitch.plugins.treesitter")
require("krleitch.plugins.gitsigns")
require("krleitch.plugins.auto-session")
require("krleitch.plugins.alpha")
require("krleitch.plugins.aerial")
require("krleitch.plugins.indent-blankline")
require("krleitch.plugins.trouble")
require("krleitch.plugins.true-zen")
require("krleitch.plugins.toggleterm")
require("krleitch.plugins.todo-comments")
require("krleitch.plugins.leap")
require("krleitch.plugins.diffview")
require("krleitch.plugins.nvim-colorizer")

-- lsp & lsp plugins
require("krleitch.plugins.lsp.mason")
require("krleitch.plugins.lsp.lspsaga")
require("krleitch.plugins.lsp.lspconfig")
require("krleitch.plugins.lsp.null-ls")
require("krleitch.plugins.lsp.fidget")
