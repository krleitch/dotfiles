local M = {
  "goolord/alpha-nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
}

function M.config()
  local theme = require("alpha.themes.theta")
  local plenary_path_status, plenary_path = pcall(require, "plenary.path")
  if not plenary_path_status then
    return
  end

  -- Header
  local logo = {
    [[                                                                   ]],
    [[      ████ ██████           █████      ██                    ]],
    [[     ███████████             █████                            ]],
    [[     █████████ ███████████████████ ███   ███████████  ]],
    [[    █████████  ███    █████████████ █████ ██████████████  ]],
    [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
    [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
    [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
  }

  local function create_gradient(start, finish, steps)
    local r1, g1, b1 =
      tonumber("0x" .. start:sub(2, 3)), tonumber("0x" .. start:sub(4, 5)), tonumber("0x" .. start:sub(6, 7))
    local r2, g2, b2 =
      tonumber("0x" .. finish:sub(2, 3)), tonumber("0x" .. finish:sub(4, 5)), tonumber("0x" .. finish:sub(6, 7))

    local r_step = (r2 - r1) / steps
    local g_step = (g2 - g1) / steps
    local b_step = (b2 - b1) / steps

    local gradient = {}
    for i = 1, steps do
      local r = math.floor(r1 + r_step * i)
      local g = math.floor(g1 + g_step * i)
      local b = math.floor(b1 + b_step * i)
      table.insert(gradient, string.format("#%02x%02x%02x", r, g, b))
    end

    return gradient
  end

  local function apply_gradient_hl(text)
    local gradient = create_gradient("#d7005f", "#d75f5f", #text)

    local lines = {}
    for i, line in ipairs(text) do
      local tbl = {
        type = "text",
        val = line,
        opts = {
          hl = "HeaderGradient" .. i,
          shrink_margin = false,
          position = "center",
        },
      }
      table.insert(lines, tbl)

      -- create hl group
      vim.api.nvim_set_hl(0, "HeaderGradient" .. i, { fg = gradient[i] })
    end

    return {
      type = "group",
      val = lines,
      opts = { position = "center" },
    }
  end

  local function get_header()
    return apply_gradient_hl(logo)
  end

  -- get vim vars
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

  -- Info section
  local function get_info()
    local color_theme = " " .. get_var("colors_name", "default")
    local datetime = os.date(" %A %B %d")
    local version = vim.version()
    local nvim_version_info = " " .. version.major .. "." .. version.minor .. "." .. version.patch

    local info_string = datetime .. "  |  " .. color_theme .. "  |  " .. nvim_version_info

    return {
      type = "text",
      val = info_string,
      opts = {
        hl = "HeaderGradient4",
        position = "center",
      },
    }
  end

  -- Links / tools
  local dashboard = require("alpha.themes.dashboard")
  local links = {
    type = "group",
    val = {
      dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
      dashboard.button("w", "  Find word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("s", "  Restore session", "<cmd>SessionRestore <CR><CR>"),
      dashboard.button("l", "  Lazy", "<cmd>Lazy<CR>"),
      dashboard.button("m", "  Mason", "<cmd>Mason<CR>"),
    },
    position = "center",
  }

  -- MRU
  local function get_mru(max_shown)
    local tbl = {
      { type = "text", val = "Recent Files", opts = { hl = "SpecialComment", position = "center" } },
    }

    local mru_list = theme.mru(1, "", max_shown)
    for _, file in ipairs(mru_list.val) do
      table.insert(tbl, file)
    end

    return { type = "group", val = tbl, opts = {} }
  end

  -- Projects
  local function get_projects(max_shown)
    local alphabet = "abcdefghijknopqrstuvwxyz"

    local tbl = {
      { type = "text", val = "Recent Projects", opts = { hl = "SpecialComment", position = "center" } },
    }

    local project_list = require("telescope._extensions.project.utils").get_projects("recent")
    for i, project in ipairs(project_list) do
      if i > max_shown then
        break
      end

      local icon = " "

      -- create shortened path for display
      local target_width = 35
      local display_path = project.path:gsub("/", "\\"):gsub("\\\\", "\\")
      if #display_path > target_width then
        display_path = plenary_path.new(display_path):shorten(1, { -2, -1 })
        if #display_path > target_width then
          display_path = plenary_path.new(display_path):shorten(1, { -1 })
        end
      end

      -- get semantic letter for project
      local project_name = display_path:match("[/\\][%w%s%.%-]*$")
      if project_name == nil then
        project_name = display_path
      end
      project_name = project_name:gsub("[/\\]", "")
      local letter = string.sub(alphabet, 1, 1):lower()

      -- remove letter from available alphabet
      alphabet = alphabet:gsub(letter, "")

      -- create button element
      local file_button_el = dashboard.button(
        letter,
        icon .. display_path,
        "<cmd>lua require('telescope.builtin').find_files( { cwd = '" .. project.path:gsub("\\", "/") .. "' }) <cr>"
      )

      -- create hl group for the start of the path
      local fb_hl = {}
      table.insert(fb_hl, { "Comment", 0, #icon + #display_path - #project_name })
      file_button_el.opts.hl = fb_hl

      table.insert(tbl, file_button_el)
    end

    return {
      type = "group",
      val = tbl,
      opts = {},
    }
  end

  -- Layout
  theme.config.layout = {
    { type = "padding", val = 5 },
    get_header(),
    { type = "padding", val = 2 },
    get_info(),
    { type = "padding", val = 2 },
    links,
    { type = "padding", val = 3 },
    get_projects(5),
    { type = "padding", val = 3 },
    get_mru(7),
    { type = "padding", val = 3 },
    dashboard.section.footer,
  }
  require("alpha").setup(theme.config)

  -- Update alpha to show load time after Lazy has started
  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = " Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M
