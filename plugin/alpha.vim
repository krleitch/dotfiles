lua << EOF

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
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

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "s", "  Restore session"   , ":RestoreSession <CR><CR>"),
    dashboard.button( "r", "  Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "f", "  Find file", "<CMD>lua require'telescope-config'.project_files()<CR>"),
    dashboard.button( "w", "  Find word", ":Telescope live_grep<CR>"),
    dashboard.button( "g", "  Git status", ":Telescope git_status<CR>"),
    dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "c", "  Config" , ":e $HOME/dotfiles/init.vim | :cd %:p:h | pwd<CR>"),
    dashboard.button( "q", "  Quit", ":qa<CR>"),
}

local fortune = require("alpha.fortune") 
dashboard.section.footer.val = fortune()

local function get_var(my_var_name, default_value)
  s, v = pcall(function()
    return vim.api.nvim_get_var(my_var_name)
  end)
  if s then return v else return default_value end
end

local function info_string()
    local datetime = os.date(" Today is %a %h %d")
    local version = vim.version()
    local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
    local current_scheme = get_var(colors_name, "Lychee")
    local theme = "   " .. current_scheme

    return datetime .. theme .. nvim_version_info 
end


local function info()
  local lines = {}

  local line = {
    type = "text",
    val = info_string(),
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
    { type = "group", val = info() },
    { type = "padding", val = 2 },
    block1,
    dashboard.section.buttons,
    dashboard.section.fortune,
    dashboard.section.footer,
  },
  opts = { margin = 5 },
})

EOF


