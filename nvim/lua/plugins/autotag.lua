
local M = {
  "windwp/nvim-ts-autotag", -- autoclose html tags
  dependences = {
    {
      "nvim-treesitter",
    },
  },
  event = "InsertEnter",
}

function M.config()
  local autotag = require("nvim-ts-autotag")
  autotag.setup()
end

return M
