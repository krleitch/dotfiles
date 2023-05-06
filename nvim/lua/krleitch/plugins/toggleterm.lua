-- import toggleterm plugin safely
local toggleterm_status, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status then
  return
end

local terminal_status, terminal = pcall(require, "toggleterm.terminal")
if not terminal_status then
  return
end

toggleterm.setup()

---@diagnostic disable-next-line: duplicate-set-field
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<leader>tt", [[<C-\><C-n>:ToggleTerm<CR>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "jj", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

-- only use these key maps in terminal mode
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- lazygit
local Terminal = terminal.Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", size = 40, hidden = true })

---@diagnostic disable-next-line: unused-function
function _Lazygit_toggle()
  lazygit:toggle()
end
