vim.g.mapleader = " "

-- Telescope
vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<cr>", {remap = false})
vim.keymap.set("n", "<leader>tgf", "<cmd>Telescope git_files<cr>", {remap = false})
vim.keymap.set("n", "<leader>tgr", "<cmd>Telescope live_grep<cr>", {remap = false})
