call plug#begin('~/.config/nvim/bundle')

  " Colorscheme
  Plug 'krleitch/nvim-lychee'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

  " notes inspired by emacs org mode, requires plenary 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-neorg/neorg'
  " vim wiki
  Plug 'vimwiki/vimwiki'
  " terminal
  Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

  " fuzzy finder
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-telescope/telescope-ui-select.nvim'
  Plug 'nvim-telescope/telescope-dap.nvim'

  " Git
  Plug 'tpope/vim-fugitive'
  " Show git diff column
  Plug 'lewis6991/gitsigns.nvim'
  " Neogit magit clone
  Plug 'TimUntersberger/neogit'
  " diffview
  Plug 'sindrets/diffview.nvim'

  " Lsp defualt config
  Plug 'neovim/nvim-lspconfig'
  " Treesitter for syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " LSP ui
  Plug 'glepnir/lspsaga.nvim'
  " view lsp status on startup
  Plug 'j-hui/fidget.nvim'
  " Rust
  Plug 'simrat39/rust-tools.nvim'
  " Formatter
  Plug 'sbdchd/neoformat'
  " Trouble for viewing diagnostics better
  Plug 'folke/trouble.nvim'
  " Show symbols list
  Plug 'stevearc/aerial.nvim'

  " Testing
  Plug 'vim-test/vim-test'
  Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

  " Debugging
  Plug 'mfussenegger/nvim-dap'
  Plug 'rcarriga/nvim-dap-ui'

  " auto completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'  
  " luasnip
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'molleweide/LuaSnip-snippets.nvim'

  " auto pairs and auto tags
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'

  " status line
  Plug 'nvim-lualine/lualine.nvim'
  " use nonicons where you can, requires kitty setup
  Plug 'yamatsum/nvim-nonicons'
  " web-dev icons
  Plug 'kyazdani42/nvim-web-devicons'
  "file tree, useful for learning structure and creating dirs
  Plug 'kyazdani42/nvim-tree.lua'

  " Startup screen
  Plug 'goolord/alpha-nvim'
  " auto sessions based on cwd
  Plug 'rmagatti/auto-session'
  " Faster Startup
  Plug 'lewis6991/impatient.nvim'
  " notifs
  Plug 'rcarriga/nvim-notify'
  " transparency
  Plug 'xiyaowong/nvim-transparent' 
  
  " Markdown preview, requires yarn
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  " Latex preview
  Plug 'lervag/vimtex'
  " Zen mode
  Plug 'Pocco81/true-zen.nvim'

  " Comments
  Plug 'tpope/vim-commentary'
  " Todo comments list
  Plug 'folke/todo-comments.nvim'
  " Fast comment frames
  Plug 's1n7ax/nvim-comment-frame'
  " Fast comment docs
  Plug 'danymat/neogen'

  " Add Indent lines
  Plug 'lukas-reineke/indent-blankline.nvim'
  " Format lines with tabs nicely
  Plug 'godlygeek/tabular'
  " get highlights out of the way after searching
  Plug 'rktjmp/highlight-current-n.nvim'

  " Hydra for modes, requires plenary
  Plug 'anuvyklack/hydra.nvim'
  Plug 'anuvyklack/keymap-layer.nvim'
  " undo tree, prefer this over using swp files
  Plug 'mbbill/undotree'
  " shift windows with vim keys in any direction
  Plug 'sindrets/winshift.nvim'
  " simple buffer explorer, nice addon for hydra windows
  Plug 'jlanzarotta/bufexplorer'
  " Vim sneak like motion with more brains
  Plug 'ggandor/leap.nvim'
  " marks for core files
  Plug 'ThePrimeagen/harpoon'
  " easy join and split lines
  Plug 'AndrewRadev/splitjoin.vim'
  " view marks in sign column
  Plug 'chentoast/marks.nvim'

  " more repeat motions with .
  Plug 'tpope/vim-repeat'
  " Surround operations
  Plug 'tpope/vim-surround'
  " comp pairs of mappings for common operations
  Plug 'tpope/vim-unimpaired'
  " abbreviation / searching / switch cases
  Plug 'tpope/vim-abolish'
  " run make async
  Plug 'tpope/vim-dispatch'

  " Use emacs best feature
  Plug 'alec-gibson/nvim-tetris'

call plug#end()

" Impatient needs to start near first
lua require('impatient')

" Import vim settings
set runtimepath^=-/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" investigate neotest
let g:ultest_deprecation_notice = 0

" lualine for statusline
set statusline=

" dont treat md files outside vimwiki as wiki files
let g:vimwiki_global_ext = 0
