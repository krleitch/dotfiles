local M = {
  "nvim-lualine/lualine.nvim", -- fancy cmdline status bar
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  local highlight = require("lualine.highlight")
  local filename = require("lualine.components.filename")
  local lualine = require("lualine")

  -- Show a save or modified icon with a highlight
  local save_icon = filename:extend()
  local default_status_colors = { saved = "#A9FF68", modified = "#d7005f" }

  function save_icon:init(options)
    save_icon.super.init(self, options)
    self.status_colors = {
      saved = highlight.create_component_highlight_group(
        { fg = default_status_colors.saved },
        "filename_status_saved",
        self.options
      ),
      modified = highlight.create_component_highlight_group(
        { fg = default_status_colors.modified },
        "filename_status_modified",
        self.options
      ),
    }
    if self.options.color == nil then
      self.options.color = ""
    end
    local icon = vim.bo.modified and " " or " "
    local data = highlight.component_format_highlight(
      vim.bo.modified and self.status_colors.modified or self.status_colors.saved
    ) .. icon
    return data
  end
  function save_icon:update_status()
    save_icon.super.update_status(self)
    local icon = vim.bo.modified and " " or " "
    local data = highlight.component_format_highlight(
      vim.bo.modified and self.status_colors.modified or self.status_colors.saved
    ) .. icon
    return data
  end

  -- source gitsigns
  local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
      return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed,
      }
    end
  end

  -- dont show utf-8
  local function encoding()
    local ret, _ = (vim.bo.fenc or vim.go.enc):gsub("^utf%-8$", "") -- Note: '-' is a magic character
    return ret
  end

  -- show passing, running, and failing tests
  local function test()
    local status = vim.api.nvim_eval("ultest#status()")

    local sections = {
      {
        sign = " ",
        count = status.running,
        base = "StatusLineRun",
        tag = "test_running",
      },
      {
        sign = " ",
        count = status.passed,
        base = "StatusLinePass",
        tag = "test_pass",
      },
      {
        sign = " ",
        count = status.failed,
        base = "StatusLineFail",
        tag = "test_fail",
      },
    }

    local result = {}
    for _, section in ipairs(sections) do
      table.insert(result, "%#" .. section.base .. "#" .. section.sign .. section.count)
    end

    return table.concat(result, " ")
  end

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "alpha", "aerial", "NvimTree", "Trouble" },
        winbar = { "alpha", "aerial", "NvimTree", "Trouble" },
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          "branch",
          icon = "",
          fmt = function(str)
            return " " .. str .. " "
          end,
        },
      },
      lualine_c = {
        {
          "filename",
          path = 0,
          symbols = {
            modified = "", -- Text to show when the file is modified.
            readonly = "  ", -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[No Name]", -- Text to show for unnamed buffers.
          },
        },
        { save_icon, padding = { left = 0, right = 0 } },
        { "diff", source = diff_source, symbols = { added = " ", modified = " ", removed = " " } },
      },
      lualine_x = {
        {
          "diagnostics",
          sources = { "nvim_lsp" },
          symbols = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
        },
        "encoding",
        "fileformat",
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = {
        "location",
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          "filename",
          path = 0,
          symbols = {
            modified = "", -- Text to show when the file is modified.
            readonly = "  ", -- Text to show when the file is non-modifiable or readonly.
            unnamed = "[No Name]", -- Text to show for unnamed buffers.
          },
        },
        { save_icon, padding = { left = 0, right = 0 } },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })

  -- Add this when you setup testing
  -- {
  --   test(),
  --   cond = function()
  --     local status_ok, is_test = pcall(vim.api.nvim_eval, "ultest#is_test_file()")
  --     return status_ok and is_test == 1
  --   end,
  -- },
end

return M
