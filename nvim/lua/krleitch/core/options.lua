local opt = vim.opt -- readability

-- line numbers
opt.relativenumber = true
opt.number = true
opt.scrolloff = 8

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- cursor
opt.guicursor = ""
-- opt.cursorline = true

-- serach
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- make '-' part of a word
opt.iskeyword:append("-")

-- undodir
opt.undodir = "~/.config/nvim/undodir"

-- Finding files - Search down into subfolders
opt.wildmode = "longest,list,full"
opt.wildmenu = true
opt.path:append("**")
opt.wildignore:append("*/node_modules/*")
