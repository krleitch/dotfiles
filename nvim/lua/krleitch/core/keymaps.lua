-- change the leader key from '\' to space
vim.g.mapleader = " "

local keymap = vim.keymap -- readability

-- general

keymap.set("i", "jj", "<ESC>") -- fast escape
keymap.set("i", "<C-e>", "<C-o>$") -- go to end
keymap.set("i", "<C-a>", "<C-o>^") -- go to start

keymap.set("n", "j", "gj") -- multiline down as default
keymap.set("n", "k", "gk") -- multiline up as default
keymap.set("n", "<leader>nh", ":nohl<CR>") -- remove highlights

keymap.set("n", "x", '"_x') -- delete single char without overwriting register

keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

keymap.set("n", "<leader>sv", "<C-w>v") -- vertical split
keymap.set("n", "<leader>sh", "<C-w>s") -- horizontal split
keymap.set("n", "<leader>sx", ":close<CR>") -- close split
keymap.set("n", "<leader>se", "<C-w>=") -- equalize splits

keymap.set("n", "<leader>to", ":tabnew<CR>") -- new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- prev tab

keymap.set("n", "<leader>ga", "<C-^>") -- go to alt file

keymap.set("n", "Y", "y$") -- make Y work like D and C instead of just being yy

keymap.set("v", "<leader>n", ":'<,'>norm") -- quick norm mode

-- plugin keymaps

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize split

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- aerial
keymap.set("n", "<leader>at", "<cmd>AerialToggle!<CR>") -- toggle aerial
keymap.set("n", "<leader>an", "<cmd>AerialNext<CR>") -- next token
keymap.set("n", "<leader>ap", "<cmd>AerialPrev<CR>") -- prev token
