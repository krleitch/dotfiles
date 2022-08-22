lua << EOF

-- trunacete long text
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

-- dont show utf-8
local function encoding()
    local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "")  -- Note: '-' is a magic character
    return ret
end

-- source gitsigns
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

local hydra = require('hydra.statusline') 
local hydra_status = require('lualine.components.filename'):extend()
local highlight = require'lualine.highlight'
local default_status_colors = { name = '#89dceb', hint = '#f28fad' }

function hydra_status:init(options)
  hydra_status.super.init(self, options)
  self.status_colors = {
    name = highlight.create_component_highlight_group(
    {fg = default_status_colors.name}, 'filename_status_saved', self.options),
    hint = highlight.create_component_highlight_group(
    {fg = default_status_colors.hint}, 'filename_status_modified', self.options),
  }
  if self.options.color == nil then self.options.color = '' end
  icon = ' '
  hydra_name = hydra.get_name() or 'Hydra'
  hydra_hint = ''
  if hydra_name == 'Norg' then
    hydra_hint = '(o)pen tab, (h)ome, (w)ork, (g)td, (t)oday, (q)uit'
  elseif hydra_name == 'Aerial' then
    hydra_hint = '(t)oggle, {, }, [, ], (o|O)pen, (c|C)lose, (q)uit'
  elseif hydra_name == 'Diag' then
    hydra_hint = '(t)oggle w, d, {, }, [, ], q(f)ix, (l)oc, (q)uit'
  end
  data = highlight.component_format_highlight(self.status_colors.name) .. icon .. hydra_name .. ': ' ..
         highlight.component_format_highlight(self.status_colors.hint) .. hydra_hint
  return data
end
function hydra_status:update_status()
  hydra_status.super.update_status(self)
  icon = ' '
  hydra_name = hydra.get_name() or 'Hydra'
  hydra_hint = ''
  if hydra_name == 'Norg' then
    hydra_hint = '(o)pen tab, (h)ome, (w)ork, (g)td, (t)oday, (q)uit'
  elseif hydra_name == 'Aerial' then
    hydra_hint = '(t)oggle, {, }, [, ], (o|O)pen, (c|C)lose, (q)uit'
  elseif hydra_name == 'Diag' then
    hydra_hint = '(t)oggle w, d, {, }, [, ], q(f)ix, (l)oc, (q)uit'
  end
  data = highlight.component_format_highlight(self.status_colors.name) .. icon .. hydra_name .. ': '  ..
         highlight.component_format_highlight(self.status_colors.hint) .. hydra_hint
  return data
end

-- show running, passing, failing test counts
local function test()
  local status = vim.api.nvim_eval('ultest#status()')

  local sections = {
      {
          sign = ' ',
          count = status.running,
          base = 'StatusLineRun',
          tag = 'test_running',
      },
      {
          sign = ' ',
          count = status.passed,
          base = 'StatusLinePass',
          tag = 'test_pass',
      },
      {
          sign = ' ',
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

-- Show a save or modified icon with a highlight
local save_icon = require('lualine.components.filename'):extend()
local highlight = require'lualine.highlight'
local default_status_colors = { saved = '#A9FF68', modified = '#d7005f' }

function save_icon:init(options)
  save_icon.super.init(self, options)
  self.status_colors = {
    saved = highlight.create_component_highlight_group(
    {fg = default_status_colors.saved}, 'filename_status_saved', self.options),
    modified = highlight.create_component_highlight_group(
    {fg = default_status_colors.modified}, 'filename_status_modified', self.options),
  }
  if self.options.color == nil then self.options.color = '' end
  icon = vim.bo.modified and ' ' or ' '
  data = highlight.component_format_highlight(vim.bo.modified
                                              and self.status_colors.modified
                                              or self.status_colors.saved) .. icon
  return data
end
function save_icon:update_status()
  save_icon.super.update_status(self)
  icon = vim.bo.modified and ' ' or ' '
  data = highlight.component_format_highlight(vim.bo.modified
                                              and self.status_colors.modified
                                              or self.status_colors.saved) .. icon
  return data
end


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'lychee',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { 'alpha', 'NvimTree', 'mind' },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {{ 'mode', fmt = function(str) return str:sub(1,1) end }},
    lualine_b = {{'branch', icon = '', fmt = function(str) return ' ' .. str end}},
    lualine_c = {
      { save_icon, padding = { left = 1, right = 0 } }, 
      { 'filename', path = 0, symbols = {
          modified = '',      -- Text to show when the file is modified.
          readonly = '  ',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
        }},
      {'diff', source = diff_source, symbols = {added = ' ', modified = ' ', removed = ' '}},
      { hydra_status, cond = function()
                    local active = hydra.is_active()
                    return active
                    end }
      
    },

    lualine_x = {
      { 'diagnostics', sources = {"nvim_lsp"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
      encoding(), 
      {'location'}},
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
    lualine_c = {{ 'filename', path = 0, symbols = {
          modified = '',      -- Text to show when the file is modified.
          readonly = '  ',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
        }},
      { save_icon, padding = { left = 0, right = 0 } }, 
      {'diff', source = diff_source, symbols = {added = ' ', modified = ' ', removed = ' '}}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  tabline = {},
  extensions = {}
}
EOF

