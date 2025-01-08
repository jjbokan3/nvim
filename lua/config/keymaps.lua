-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- keymaps.lua (or your custom keymaps file)
vim.keymap.set("n", "<leader>D", "<Plug>(doge-generate)", { desc = "Generate docstring" })
