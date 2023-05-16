local M = {
  "norcalli/nvim-colorizer.lua",
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },
}

function M.config()
  require("colorizer").setup({
    "css",
  })
end

return M
