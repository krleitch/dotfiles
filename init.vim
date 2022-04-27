call plug#begin('~/.config/nvim/bundle')

  " Colorscheme
  " Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'krleitch/nvim-lychee'
  Plug 'norcalli/nvim-colorizer.lua'

  " Git
  Plug 'tpope/vim-fugitive'
  " Show git diff column
  Plug 'lewis6991/gitsigns.nvim'

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

  " fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " auto pairs and auto tags
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'

  " status line
  Plug 'nvim-lualine/lualine.nvim'
  " web-dev icons
  Plug 'kyazdani42/nvim-web-devicons'

  " Smooth scrolling
  Plug 'karb94/neoscroll.nvim'
  " Comments
  Plug 'terrortylor/nvim-comment'
  " Add Indent lines
  Plug 'lukas-reineke/indent-blankline.nvim'
  " Startup screen
  Plug 'goolord/alpha-nvim'
  " Faster Startup
  Plug 'lewis6991/impatient.nvim'

  " Elixir mix format on save
  Plug 'mhinz/vim-mix-format'

  " Use emacs best feature
  Plug 'alec-gibson/nvim-tetris'

call plug#end()

" Import vim settings
set runtimepath^=-/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Impatient needs to start near first
lua require('impatient')

" vim-signify update time
set updatetime=1000

" elixir format on save
let g:mix_format_on_save = 1

