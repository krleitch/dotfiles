call plug#begin('~/.config/nvim/bundle')

  " Colorscheme
  " Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'krleitch/nvim-lychee'
  Plug 'norcalli/nvim-colorizer.lua'

  " fuzzy finder
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  " file tree, useful for learning structure and creating dirs
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " Git
  Plug 'tpope/vim-fugitive'
  " Show git diff column
  Plug 'lewis6991/gitsigns.nvim'
  " diff views
  Plug 'sindrets/diffview.nvim'

  " Lsp defualt config
  Plug 'neovim/nvim-lspconfig'
  " Improve lsp ui
  Plug 'tami5/lspsaga.nvim'
  " Treesitter for syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Trouble for viewing diagnostics better
  Plug 'folke/trouble.nvim'

  " auto completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  " For vsnip users.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'  

  " auto pairs and auto tags
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'

  " status line
  Plug 'nvim-lualine/lualine.nvim'
  " web-dev icons
  Plug 'kyazdani42/nvim-web-devicons'

  " Startup screen
  Plug 'goolord/alpha-nvim'
  " Faster Startup
  Plug 'lewis6991/impatient.nvim'
  " notifs
  Plug 'rcarriga/nvim-notify'
  " transparency
  Plug 'xiyaowong/nvim-transparent' 

  " Smooth scrolling
  Plug 'karb94/neoscroll.nvim'
  " Comments
  Plug 'terrortylor/nvim-comment'
  " Todo Comments
  Plug 'folke/todo-comments.nvim'
  " Add Indent lines
  Plug 'lukas-reineke/indent-blankline.nvim'
  " Vim sneak
  Plug 'justinmk/vim-sneak'
  " Show symbols list
  Plug 'stevearc/aerial.nvim'

  " notes, requires plenary 
  Plug 'nvim-neorg/neorg'

  " Elixir mix format on save
  Plug 'mhinz/vim-mix-format'

  " Use emacs best feature
  Plug 'alec-gibson/nvim-tetris'

call plug#end()

" Impatient needs to start near first
lua require('impatient')

" Import vim settings
set runtimepath^=-/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" show nerdtree hidden files
let NERDTreeShowHidden=1

" minimalist vim-easymotion
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" elixir format on save
let g:mix_format_on_save = 1

