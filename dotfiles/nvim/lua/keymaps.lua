vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Diagnostic List" })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<PageUp>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("", "<PageDown>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", "q", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "q", ":q<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "j", ":w<CR>", { noremap = true, silent = true })

