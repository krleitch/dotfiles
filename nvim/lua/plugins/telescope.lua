local M = {
  "nvim-telescope/telescope.nvim",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-project.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
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
          "~/Documents/repos/spot/",
          "~/Documents/repos/resume/",
          "~/Documents/repos/wasm-rust-synth/",
        },
        hidden_files = false,
        theme = "dropdown",
        order_by = "recent",
        search_by = "title",
        on_project_selected = function(prompt_bufnr)
          project_actions.find_project_files(prompt_bufnr, false)
          -- project_actions.change_working_directory(prompt_bufnr)
          -- vim.cmd("%bw!")
        end,
      },
    },
  })

  telescope.load_extension("project")
end

return M
