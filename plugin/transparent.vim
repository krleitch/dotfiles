if !exists('g:loaded_transparent') | finish | endif
finish
lua << EOF
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups
    
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

    -- ufo
    "SignColumn",

  },
  exclude = {

    -- norg
    "NeorgCodeBlock",

    -- bufferline
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
    "BufferLineTab",
    "BufferLineTabSelected",
    "BufferLineBufferVisible",

  }, -- table: groups you don't want to clear
})
EOF
