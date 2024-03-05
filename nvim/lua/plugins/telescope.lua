local M = {
  "nvim-telescope/telescope.nvim", -- file picker with fzf
  tag = "0.1.4",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-project.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  event = "VeryLazy",
  -- cmd = "Telescope",
}

function M.config()
  local actions = require("telescope.actions")
  local project_actions = require("telescope._extensions.project.actions")
  local telescope = require("telescope")

  telescope.setup({
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      mappings = {
        i = {
          ["<C-k>"] = actions.move_selection_previous, -- move to prev result
          ["<C-j>"] = actions.move_selection_next, -- move to next result
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
      project = {
        base_dirs = {
          "~/repos/Kevin-Leitch-resume/",
        },
        hidden_files = false,
        theme = "dropdown",
        order_by = "recent",
        search_by = "title",
        on_project_selected = function(prompt_bufnr)
          project_actions.find_project_files(prompt_bufnr, false)
        end,
      },
    },
  })

  -- Load extensions
  telescope.load_extension("project")
  telescope.load_extension("fzf")
end

return M
