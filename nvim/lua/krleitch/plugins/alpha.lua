-- import alpha safely
local alpha_setup, alpha = pcall(require, "alpha")
if not alpha_setup then
  return
end

local dashboard_setup, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_setup then
  return
end

local fortune_setup, fortune = pcall(require, "alpha.fortune")
if not fortune_setup then
  return
end

-- set header
local header = {
  [[                                                                   ]],
  [[      ████ ██████           █████      ██                    ]],
  [[     ███████████             █████                            ]],
  [[     █████████ ███████████████████ ███   ███████████  ]],
  [[    █████████  ███    █████████████ █████ ██████████████  ]],
  [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
  [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
  [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
}

local function colorize_header()
  local lines = {}

  for i, chars in pairs(header) do
    local line = {
      type = "text",
      val = chars,
      opts = {
        hl = "StartLogo" .. i,
        shrink_margin = false,
        position = "center",
      },
    }

    table.insert(lines, line)
  end

  return lines
end

-- set menu
dashboard.section.buttons.val = {
  dashboard.button("s", "  Restore session", ":SessionRestore <CR><CR>"),
  dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("f", "  Find file", "<CMD>lua require'telescope-config'.project_files()<CR>"),
  dashboard.button("w", "  Find word", ":Telescope live_grep<CR>"),
  dashboard.button("g", "  Git status", ":Telescope git_status<CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("c", "  Config", ":e $HOME/dotfiles/init.vim | :cd %:p:h | pwd<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- set footer
dashboard.section.footer.val = fortune()

local function get_var(my_var_name, default_value)
  local s, v = pcall(function()
    return vim.api.nvim_get_var(my_var_name)
  end)
  if s then
    return v
  else
    return default_value
  end
end

local function info_one_string()
  local datetime = os.date(" Today is %a %h %d")
  local version = vim.version()
  local nvim_version_info = "   " .. version.major .. "." .. version.minor .. "." .. version.patch
  local current_scheme = get_var("colors_name", "default")
  local theme = "   " .. current_scheme

  return datetime .. theme .. nvim_version_info
end

local function info_one()
  local lines = {}

  local line = {
    type = "text",
    val = info_one_string(),
    opts = {
      hl = "StartLogo4",
      shrink_margin = false,
      position = "center",
    },
  }
  table.insert(lines, line)

  return lines
end

local function get_plugins_list()
  local short_name = require("packer.util").get_plugin_short_name
  local list_plugins = require("packer.plugin_utils").list_installed_plugins

  local opt, start = list_plugins()
  local plugin_paths = vim.tbl_extend("force", opt, start)
  local plugins = {}

  for path in pairs(plugin_paths) do
    local name, _ = short_name({ path }):gsub(".nvim", "")
    table.insert(plugins, name)
  end

  table.sort(plugins)

  return plugins
end

local function info_two_string()
  local plugins = get_plugins_list()

  return "  " .. #plugins .. " plugins loaded"
end

local function info_two()
  local lines = {}

  local line = {
    type = "text",
    val = info_two_string(),
    opts = {
      hl = "StartLogo4",
      shrink_margin = false,
      position = "center",
    },
  }
  table.insert(lines, line)

  return lines
end

alpha.setup({
  layout = {
    { type = "padding", val = 4 },
    { type = "group", val = colorize_header() },
    { type = "padding", val = 2 },
    { type = "group", val = info_one() },
    { type = "padding", val = 1 },
    { type = "group", val = info_two() },
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    dashboard.section.fortune,
    dashboard.section.footer,
  },
  opts = { margin = 5 },
})
