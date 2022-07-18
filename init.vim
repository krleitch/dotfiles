call plug#begin('~/.config/nvim/bundle')

  " Colorscheme
  Plug 'krleitch/nvim-lychee'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'norcalli/nvim-colorizer.lua'

  " notes inspired by emacs org mode, requires plenary 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-neorg/neorg'
  " vim wiki
  Plug 'vimwiki/vimwiki'
  " floating term
  Plug 'voldikss/vim-floaterm'
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
  " use nonicons where you can, requires kitty setup
  Plug 'yamatsum/nvim-nonicons'
  " web-dev icons
  Plug 'kyazdani42/nvim-web-devicons'

  "file tree, useful for learning structure and creating dirs
  Plug 'kyazdani42/nvim-tree.lua'

  " Startup screen
  Plug 'goolord/alpha-nvim'
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
  Plug 'Pocco81/TrueZen.nvim'

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

  " auto sessions based on cwd
  Plug 'rmagatti/auto-session'
  " Hydra for modes, requires plenary
  Plug 'anuvyklack/hydra.nvim'
  Plug 'anuvyklack/keymap-layer.nvim'
  " shift windows with vim keys in any direction
  Plug 'sindrets/winshift.nvim'
  " simple buffer explorer, nice addon for hydra windows
   Plug 'jlanzarotta/bufexplorer'
  " Vim sneak like motion with more brains
  Plug 'ggandor/leap.nvim'
  " marks for core files
  Plug 'ThePrimeagen/harpoon'
  " undo tree, prefer this over using swp files
  Plug 'mbbill/undotree'
  " easy join and split lines
  Plug 'AndrewRadev/splitjoin.vim'
  " better folds
  Plug 'kevinhwang91/nvim-ufo'

  " more repeat motions with .
  Plug 'tpope/vim-repeat'
  " Surround operations
  Plug 'tpope/vim-surround'
  " comp pairs of mappings for common operations
  Plug 'tpope/vim-unimpaired'
  " abbreviation / searching / switch cases
  Plug 'tpope/vim-abolish'
  " make async
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

" Folds use tree sitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set foldlevel=99
set fillchars=fold:\
set foldtext=CustomFoldText()
setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)
function! GetPotionFold(lnum)
  if getline(a:lnum) =~? '\v^\s*$'
    return '-1'
  endif
  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlankLine(a:lnum))
  if next_indent == this_indent
    return this_indent
  elseif next_indent < this_indent
    return this_indent
  elseif next_indent > this_indent
    return '>' . next_indent
  endif
endfunction
function! IndentLevel(lnum)
    return indent(a:lnum) / &shiftwidth
endfunction
function! NextNonBlankLine(lnum)
  let numlines = line('$')
  let current = a:lnum + 1
  while current <= numlines
      if getline(current) =~? '\v\S'
          return current
      endif
      let current += 1
  endwhile
  return -2
endfunction
function! CustomFoldText()
  " get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif
  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr))
  return line . expansionString . foldSizeStr . foldLevelStr
endfunction

" investigate neotest
let g:ultest_deprecation_notice = 0

