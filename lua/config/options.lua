-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Makes Neovim use the system clipboard
vim.g.doge_doc_standard_python = "google"
vim.opt.scrolloff = 999

-- Set the background to black
vim.opt.background = "dark"
-- Override the Normal highlight group to force black background
vim.api.nvim_set_hl(0, "Normal", { bg = "black" })


-- Set black background
vim.cmd([[highlight Normal guibg=black]])

