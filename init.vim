call plug#begin('~/.config/nvim/bundle')

  " Colorscheme
  " Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'krleitch/nvim-lychee'
  Plug 'norcalli/nvim-colorizer.lua'

  " Git
  Plug 'tpope/vim-fugitive'
  " Show git diff column
  Plug 'mhinz/vim-signify'

  " Lsp defualt config
  Plug 'neovim/nvim-lspconfig'
  " Improve lsp ui
  Plug 'tami5/lspsaga.nvim'

  " Treesitter for syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " Trouble for viewing diagnostics better
  Plug 'folke/trouble.nvim'

  " auto completion
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " 9000+ Snippets
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  " lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
  " Need to **configure separately**
  Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
  " - shell repl
  " - nvim lua api
  " - scientific calculator
  " - comment banner
  " - etc

  " fuzzy finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " status line
  Plug 'nvim-lualine/lualine.nvim'
  " web-dev icons
  Plug 'kyazdani42/nvim-web-devicons'

  " Elixir mix format on save
  Plug 'mhinz/vim-mix-format'

  " Use emacs best feature
  Plug 'alec-gibson/nvim-tetris'

call plug#end()

" Import vim settings
set runtimepath^=-/.vim runtimepath+=/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" vim-signify update time
set updatetime=1000

" auto start COQ
let g:coq_settings = { 'auto_start': "shut-up" }

" elixir format on save
let g:mix_format_on_save = 1

