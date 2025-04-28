-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
--

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    local total_lines = vim.o.lines -- Get total number of lines in the Neovim window
    local target_height = math.floor(total_lines / 3) -- Take 1/3 of the height
    vim.cmd("resize " .. target_height)
  end,
})

-- fire on every buffer‐enter
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(ev)
    -- only care about Neo-tree windows
    if vim.bo[ev.buf].filetype ~= "neo-tree" then
      return
    end
    -- and only when the 'calendar' source is active
    if vim.b[ev.buf].source == "calendar" then
      -- your logic here!
      print("Hey, the calendar just opened!")
    end
  end,
})
