local M = {
  "glepnir/lspsaga.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  event = "VeryLazy",
}

function M.config()
  require("lspsaga").setup({
    -- keybinds for navigation in lspsaga window
    move_in_saga = { prev = "<C-k>", next = "<C-j>" },
    -- use enter to open file with finder
    finder_action_keys = {
      open = "<CR>",
    },
    -- use enter to open file with definition preview
    definition_action_keys = {
      edit = "<CR>",
    },
    code_action_lightbulb = {
      enable = false,
      enable_in_insert = false,
      cache_code_action = true,
      sign = true,
      aupdate_time = 150,
      sign_priority = 20,
      virtual_text = true,
    },
    diagnostic_header = { " ", " ", " ", " " },
  })
end

return M
