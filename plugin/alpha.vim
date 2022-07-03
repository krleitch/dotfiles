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
    dashboard.button( "r", " Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "f", " Find git file", ":GFiles<CR>"),
    dashboard.button( "e", " New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "q", " Quit", ":qa<CR>"),
}

local fortune = require("alpha.fortune") 
dashboard.section.footer.val = fortune()

alpha.setup({
  layout = {
    { type = "padding", val = 4 },
    { type = "group", val = colorize_header() },
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    dashboard.section.footer,
  },
  opts = { margin = 5 },
})

EOF


