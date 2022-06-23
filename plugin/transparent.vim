if !exists('g:loaded_transparent') | finish | endif

lua << EOF
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
    
    -- nvim tree
    "NvimTreeNormal",
    "NvimTreeSeperator",
    "NvimTreeEndOfBuffer",
    "NvimTreeCursorLine",
    "NvimTreeWinSeparator",
    "NvimTreeStatusLine",
    "NvimTreeStatusLineNC",
    "NvimTreeSignColumn",
    "NvimTreeNormalNC",
    "NvimTreeVertSplit",
    
    -- git signs
    "GitSignsAdd",
    "GitSignsChange",
    "GitSignsDelete",

  },
  exclude = {}, -- table: groups you don't want to clear
})
EOF
