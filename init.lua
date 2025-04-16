-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- require("blink.cmp").setup({
--   completion = {
--     trigger = { show_on_keyboard = true },
--     list = { selection = { preselect = true, auto_insert = true } },
--     documentation = { auto_show = true, auto_show_delay_ms = 500 },
--     menu = { auto_show = true },
--   },
-- })

-- Set transparent background
-- vim.cmd[[
-- highlight Normal guibg=NONE ctermbg=NONE
-- highlight SignColumn guibg=NONE ctermbg=NONE
-- highlight NormalFloat guibg=NONE ctermbg=NONE
-- ]]

-- Set transparent background for various contexts
-- vim.api.nvim_create_autocmd("ColorScheme", {
--   pattern = "*",
--   callback = function()
--     -- Basic background transparency
--     vim.cmd([[
--       highlight Normal guibg=NONE ctermbg=NONE
--       highlight SignColumn guibg=NONE ctermbg=NONE
--       highlight NormalFloat guibg=NONE ctermbg=NONE
--
--       " Neo-tree specific transparency
--       highlight NeoTreeNormal guibg=NONE ctermbg=NONE
--       highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
--       highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
--
--       " Ensure transparency persists in inactive windows
--       highlight NormalNC guibg=NONE ctermbg=NONE
--     ]])
--   end,
-- })
