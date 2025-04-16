-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- keymaps.lua (or your custom keymaps file)

-- doge-generate
vim.keymap.set("n", "<leader>D", "<Plug>(doge-generate)", { desc = "Generate docstring" })

-- Lsp Hover
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Hover" })

-- Vimspector
vim.keymap.set("n", "<leader>db", "<Plug>VimspectorBreakpoints", { desc = "Opens Debug Window" })
vim.keymap.set("n", "<F5>", "<Plug>VimspectorContinue", { noremap = false, silent = true })
vim.keymap.set("n", "<F3>", "<Plug>VimspectorStop", { noremap = false, silent = true })
vim.keymap.set("n", "<F4>", "<Plug>VimspectorRestart", { noremap = false, silent = true })
vim.keymap.set("n", "<F6>", "<Plug>VimspectorPause", { noremap = false, silent = true })
vim.keymap.set("n", "<F9>", "<Plug>VimspectorToggleBreakpoint", { noremap = false, silent = true })
vim.keymap.set("n", "<leader><F9>", "<Plug>VimspectorToggleConditionalBreakpoint", { noremap = false, silent = true })
vim.keymap.set("n", "<F8>", "<Plug>VimspectorAddFunctionBreakpoint", { noremap = false, silent = true })
vim.keymap.set("n", "<leader><F8>", "<Plug>VimspectorRunToCursor", { noremap = false, silent = true })
vim.keymap.set("n", "<F10>", "<Plug>VimspectorStepOver", { noremap = false, silent = true })
vim.keymap.set("n", "<F11>", "<Plug>VimspectorStepInto", { noremap = false, silent = true })
vim.keymap.set("n", "<F12>", "<Plug>VimspectorStepOut", { noremap = false, silent = true })
vim.keymap.set("n", "<leader>ds", "<Plug>VimspectorContinue", { desc = "Starts Debugging" })
vim.keymap.set("n", "<leader>dq", "<Plug>VimspectorReset", { desc = "Ends Debugging" })
vim.keymap.set("n", "<leader>di", "<Plug>VimspectorBalloonEval", { desc = "Debug Inspect" })
vim.keymap.set("v", "<leader>di", "<Plug>VimspectorBalloonEval", { desc = "Debug Inspect" })

-- Gitsigns
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { noremap = true, silent = true }) -- Preview current hunk
vim.keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>", { noremap = true, silent = true }) -- Show diff

vim.keymap.set("n", "X", ":bdelete<CR>", { noremap = true, silent = true }) -- Show diff

-- Run Python file with <leader>r
vim.keymap.set("n", "<leader>r", ":w<CR>:!python %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>R", function()
  -- Save the file
  vim.cmd("w")

  -- Run the Python script and capture the output
  local file = vim.fn.expand("%")
  local output = vim.fn.system("python3 " .. file)

  -- Create a popup to display the output
  local buf = vim.api.nvim_create_buf(false, true) -- Create a scratch buffer
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(output, "\n"))

  local width = math.ceil(vim.o.columns * 0.8)
  local height = math.ceil(vim.o.lines * 0.8)
  local row = math.ceil((vim.o.lines - height) / 2)
  local col = math.ceil((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- Map `q` to close the popup
  vim.api.nvim_buf_set_keymap(buf, "n", "q", "", {
    noremap = true,
    silent = true,
    callback = function()
      vim.api.nvim_win_close(win, true) -- Close the floating window
      vim.api.nvim_buf_delete(buf, { force = true }) -- Delete the buffer
    end,
  })
end, { noremap = true, silent = true })

--
-- Define custom colors for LSP icons
-- vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#FFD700" }) -- Gold for Class
-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#00FF00" }) -- Green for Function
-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#1E90FF" }) -- Blue for Variable
-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#FF69B4" }) -- Pink for Interface
-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#FF4500" }) -- Orange for Keyword
-- vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#8A2BE2" }) -- Purple for Field
-- vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#00CED1" }) -- Teal for Module
