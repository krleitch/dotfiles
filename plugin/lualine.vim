" lualine doesnt set loaded...
" if !exists('g:loaded_lualine') | finish | endif

" setup lualine
lua << EOF

local function truncate(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end
local function min_window_width(width)
  return function() return vim.fn.winwidth(0) > width end
end

local custom_components = {
  -- Override 'encoding': Don't display if encoding is UTF-8.
  encoding = function()
    local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")  -- Note: '-' is a magic character
    return ret
  end,
  -- LSP status, with some trim
  lsp_status = function()
    return LspStatus()
  end
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'lychee',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { 'alpha' },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {{ 'filename', path = 0}, '%02n' },

    lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      custom_components.encoding,
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF
