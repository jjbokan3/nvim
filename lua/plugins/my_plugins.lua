return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Use the latest version
    config = function()
      require("toggleterm").setup({
        size = 90, -- Height of the terminal split
        open_mapping = [[<c-\>]], -- Keybinding to toggle terminal
        direction = "vertical", -- Terminal opens in a horizontal split
      })
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" }, -- Ensures LSP is installed
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(_, bufnr)
            -- Keybindings for Rust-specific functionality
            local opts = { noremap = true, silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rr", "<cmd>RustRun<CR>", opts)
            vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rd", "<cmd>RustDebuggables<CR>", opts)
          end,
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup({
        -- You can configure additional options here.
      })
      -- Example keymaps:
      -- Yank in visual mode to system clipboard via OSC52:
      vim.keymap.set("v", "<leader>y", require("osc52").copy_visual, { desc = "OSC52 Yank" })
    end,
  },
  {
    "Saecki/crates.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- Automatically load when you open a Cargo.toml
    event = { "BufRead Cargo.toml" },
    config = function()
      require("crates").setup({
        -- You can put your custom config here, for example:
        popup = {
          autofocus = true,
        },
      })
    end,
  },
  {
    "eandrju/cellular-automaton.nvim",
    -- Optionally load only when needed:
    cmd = { "CellularAutomaton" },
    config = function()
      -- No required config here, but you can add custom setups if needed
      -- e.g., require("cellular-automaton").register_animation(custom_animation)
    end,
  },
}
