local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Reload neovim when you save this file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Quit these files fast
vim.cmd([[
  augroup QuitFast
    autocmd!
    autocmd FileType Help nnoremap <C-c> :q!<CR>
    autocmd FileType harpoon nnoremap <C-c> :q!<CR>
    autocmd FileType NvimTree nnoremap <C-c> :q!<CR>
    autocmd FileType TelescopePrompt nnoremap <C-c> :q!<CR>
    autocmd FileType vim-plug nnoremap <C-c> :q!<CR>
    autocmd FileType mind nnoremap <C-c> :q!<CR>
  augroup END
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim") -- lua functions plugins may use

  -- colorscheme
  use("krleitch/nvim-lychee")

  -- see colors in buffer
  use("norcalli/nvim-colorizer.lua")

  -- window management
  use("christoomey/vim-tmux-navigator")
  use("Pocco81/true-zen.nvim")

  -- essential plugins
  use("tpope/vim-surround")
  use("tpope/vim-fugitive")
  use("tpope/vim-repeat")
  use("tpope/vim-unimpaired")
  use("vim-scripts/ReplaceWithRegister")

  -- harpoon
  use("ThePrimeagen/harpoon")

  -- faster startup time using a cache
  use("lewis6991/impatient.nvim")

  -- comments
  use("numToStr/Comment.nvim")

  -- file explorer and undo tree
  use("nvim-tree/nvim-tree.lua")
  use("mbbill/undotree")

  -- icons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")

  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths
  use("hrsh7th/cmp-cmdline") -- source for the cmd line

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use("hrsh7th/cmp-nvim-lsp-signature-help") -- lsp sig help
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("simrat39/rust-tools.nvim") -- additional functionality for rust
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
  use("j-hui/fidget.nvim") -- show lsp loading progress on start

  -- debugging lsp
  use("mfussenegger/nvim-dap") -- debugging
  use("jayp0521/mason-nvim-dap.nvim") -- bridges gap b/w mason and nvim-dap

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
  use("sindrets/diffview.nvim") -- see diffs side by side

  -- sessions and startup
  use("rmagatti/auto-session")
  use("goolord/alpha-nvim")

  -- code outline
  use("stevearc/aerial.nvim")

  -- show indent lines
  use("lukas-reineke/indent-blankline.nvim")

  -- pretty diagnostic viewer and TODO comments
  use("folke/trouble.nvim")
  use("folke/todo-comments.nvim")

  -- toggle a terminal
  use("akinsho/toggleterm.nvim")

  -- easymotion
  use("ggandor/leap.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
