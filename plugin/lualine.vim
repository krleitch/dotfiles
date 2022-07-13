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

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

local function test()
  local status = vim.api.nvim_eval('ultest#status()')

  local sections = {
      {
          sign = ' ',
          count = status.running,
          base = 'StatusLineRun',
          tag = 'test_running',
      },
      {
          sign = ' ',
          count = status.passed,
          base = 'StatusLinePass',
          tag = 'test_pass',
      },
      {
          sign = ' ',
          count = status.failed,
          base = 'StatusLineFail',
          tag = 'test_fail',
      }
  }

  local result = {}
  for _, section in ipairs(sections) do
      table.insert(
          result,
          '%#'
              .. section.base
              .. '#'
              .. section.sign
              .. section.count
      )
  end

  return table.concat(result, ' ')
end

local custom_fname = require('lualine.components.filename'):extend()
local highlight = require'lualine.highlight'
local default_status_colors = { saved = '#A9FF68', modified = '#d7005f' }

function custom_fname:init(options)
  custom_fname.super.init(self, options)
  self.status_colors = {
    saved = highlight.create_component_highlight_group(
      {fg = default_status_colors.saved}, 'filename_status_saved', self.options),
    modified = highlight.create_component_highlight_group(
      {fg = default_status_colors.modified}, 'filename_status_modified', self.options),
  }
  if self.options.color == nil then self.options.color = '' end
end

function custom_fname:update_status()
  local data = custom_fname.super.update_status(self)
  data = highlight.component_format_highlight(vim.bo.modified
                                              and self.status_colors.modified
                                              or self.status_colors.saved) .. data
  return data
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'lychee',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { 'alpha', 'NvimTree' },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {{ 'mode', fmt = function(str) return str:sub(1,1) end }},
    lualine_b = {{'branch', icon = '', fmt = function(str) return ' ' .. str end}},
    lualine_c = {{ custom_fname, path = 0, symbols = {
        modified = '',      -- Text to show when the file is modified.
        readonly = '  ',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        }}, {'diff', source = diff_source, symbols = {added = ' ', modified = ' ', removed = ' '}} },

    lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      custom_components.encoding(),{'location'}},
    lualine_y = {{'progress', fmt = function(str) return '%P' end }},
    lualine_z = {{'filetype', padding = { left = 2, right = 1}},
                 { test(), cond = function()
                    local status_ok, is_test = pcall(
                      vim.api.nvim_eval,
                      'ultest#is_test_file()'
                    )
                    return status_ok and is_test == 1
                    end }
                 }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{ custom_fname, path = 0, symbols = {
        modified = '',      -- Text to show when the file is modified.
        readonly = '  ',      -- Text to show when the file is non-modifiable or readonly.
        unnamed = '[No Name]', -- Text to show for unnamed buffers.
        }}, {'diff', source = diff_source, symbols = {added = ' ', modified = ' ', removed = ' '}}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {}
}
EOF

