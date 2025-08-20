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
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", -- optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    opts = {
      -- you can add config here, or leave empty
    },
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    "kkoomen/vim-doge",
    build = ":call doge#install()",
  },
  -- {
  --   "puremourning/vimspector",
  --   -- You can load it only when needed:
  --   -- cmd = {
  --   --   "VimspectorInstall",
  --   --   "VimspectorUpdate",
  --   --   "VimspectorLaunch",
  --   --   "VimspectorReset",
  --   --   -- ... plus any other commands you’d like to lazy-load for
  --   -- },
  --   config = function()
  --     -- Put global vimspector-related settings here
  --     -- e.g.:
  --     vim.g.vimspector_enable_mappings = "HUMAN"
  --
  --     -- Example: You might want to define some additional mappings,
  --     -- or load a "gadgets" file, etc.
  --
  --     -- See the official docs for more advanced usage
  --     -- or to handle :VimspectorInstall [gadgets] from here.
  --   end,
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   opts = {
  --     keymap = { preset = "default" },
  --
  --     appearance = {
  --       use_nvim_cmp_as_default = true,
  --       nerd_font_variant = "mono",
  --     },
  --
  --     signature = { enabled = true },
  --   },
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   opts = {
  --     -- existing stuff
  --     keymap = { preset = "default" },
  --     appearance = {
  --       use_nvim_cmp_as_default = true,
  --       nerd_font_variant = "mono",
  --     },
  --     signature = { enabled = true },
  --
  --     -- Add this `completion` table:
  --     completion = {
  --       menu = {
  --         -- If you also want the menu to auto-show on typing:
  --         auto_show = true,
  --
  --         draw = {
  --           columns = {
  --             -- Left column: label + label_description (with 1 space gap)
  --             { "label", "label_description", gap = 5 },
  --             -- Right column: kind_icon + kind
  --             { "kind_icon", "kind" },
  --           },
  --           -- You can also tweak other settings like
  --           -- `treesitter = { 'lsp' }` or `max_width`, etc.
  --         },
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "saghen/blink.cmp",
  --   version = "v0.*",
  --   dependencies = { "rafamadriz/friendly-snippets" },
  --   opts = {
  --     keymap = {
  --       -- Confirm the currently selected completion with Tab
  --       ["<Tab>"] = { "accept", "fallback" },
  --       -- Navigate the completion menu with Down and Up arrow keys
  --       ["<Down>"] = { "select_next", "fallback" },
  --       ["<Up>"] = { "select_prev", "fallback" },
  --       -- Optional: navigate backward in the completion menu with Shift + Tab
  --       ["<S-Tab>"] = { "select_prev", "fallback" },
  --     },
  --     -- Other configuration options...
  --   },
  -- },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.python = { "isort", "black" } -- Use isort first, then black
      opts.formatters = opts.formatters or {}
      opts.formatters.isort = {
        command = "isort",
        args = { "--stdout", "--profile", "black", "-" },
        stdin = true,
      }
    end,
  },
  {
    "mechatroner/rainbow_csv",
    ft = { "csv", "tsv", "txt" }, -- Load only for specific file types
    config = function()
      -- Optional: Add custom settings here
      vim.g.rcsv_delimiters = { "\t", ",", ";", "|" } -- List of delimiters
      vim.g.rcsv_colorpairs = {
        { "red", "red" },
        { "blue", "blue" },
        { "green", "green" },
        { "magenta", "magenta" },
        { "yellow", "yellow" },
      }
    end,
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    -- Primary plugin
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },

    -- Configure plugin
    config = function()
      -- These are the same settings you listed
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require("windows").setup()
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 1000, -- higher priority = load earlier
    config = function()
      require("markview").setup({
        experimental = {
          check_rtp_message = false, -- (optional) hide message
        },
      })
      require("markview.extras.checkboxes").setup()
    end,
  },
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
        config = function()
          require("litee.lib").setup()
        end,
      },
    },
    config = function()
      require("litee.gh").setup({
        -- deprecated, around for compatability for now.
        jump_mode = "invoking",
        -- remap the arrow keys to resize any litee.nvim windows.
        map_resize_keys = false,
        -- do not map any keys inside any gh.nvim buffers.
        disable_keymaps = false,
        -- the icon set to use.
        icon_set = "default",
        -- any custom icons to use.
        icon_set_custom = nil,
        -- whether to register the @username and #issue_number omnifunc completion
        -- in buffers which start with .git/
        git_buffer_completion = true,
        -- defines keymaps in gh.nvim buffers.
        keymaps = {
          -- when inside a gh.nvim panel, this key will open a node if it has
          -- any futher functionality. for example, hitting <CR> on a commit node
          -- will open the commit's changed files in a new gh.nvim panel.
          open = "<CR>",
          -- when inside a gh.nvim panel, expand a collapsed node
          expand = "zo",
          -- when inside a gh.nvim panel, collpased and expanded node
          collapse = "zc",
          -- when cursor is over a "#1234" formatted issue or PR, open its details
          -- and comments in a new tab.
          goto_issue = "gd",
          -- show any details about a node, typically, this reveals commit messages
          -- and submitted review bodys.
          details = "d",
          -- inside a convo buffer, submit a comment
          submit_comment = "<C-s>",
          -- inside a convo buffer, when your cursor is ontop of a comment, open
          -- up a set of actions that can be performed.
          actions = "<C-a>",
          -- inside a thread convo buffer, resolve the thread.
          resolve_thread = "<C-r>",
          -- inside a gh.nvim panel, if possible, open the node's web URL in your
          -- browser. useful particularily for digging into external failed CI
          -- checks.
          goto_web = "gx",
        },
      })
    end,
  },
  {
    "Dan7h3x/neaterm.nvim",
    branch = "stable",
    event = "VeryLazy",
    opts = {
      -- Your custom options here (optional)
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
  },
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      -- Install tries to automatically detect the install method.
      -- if it fails, try calling it with one of these parameters:
      --    "curl", "wget", "bitsadmin", "go"
      require("dbee").install()
    end,
    config = function()
      require("dbee").setup()
    end,
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      "3rd/image.nvim",
    },
    opts = { -- you can just pass {}, defaults below
      renderer_options = {
        mermaid = {
          background = nil, -- nil | "transparent" | "white" | "#hex"
          theme = nil, -- nil | "default" | "dark" | "forest" | "neutral"
          scale = 1, -- nil | 1 (default) | 2  | 3 | ...
          width = nil, -- nil | 800 | 400 | ...
          height = nil, -- nil | 600 | 300 | ...
        },
        plantuml = {
          charset = nil,
        },
        d2 = {
          theme_id = nil,
          dark_theme_id = nil,
          scale = nil,
          layout = nil,
          sketch = nil,
        },
        gnuplot = {
          size = nil, -- nil | "800,600" | ...
          font = nil, -- nil | "Arial,12" | ...
          theme = nil, -- nil | "light" | "dark" | custom theme string
        },
      },
    },
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    cmd = { "Octo" },
    config = function()
      require("octo").setup()
    end,
  },
  -- { "tpope/vim-dadbod", lazy = true },
  -- {
  --   "kristijanhusak/vim-dadbod-ui",
  --   dependencies = { "tpope/vim-dadbod" },
  --   ft = "sql", -- load when you open a .sql file
  --   config = function()
  --     -- your connection
  --     vim.b.db = "postgresql://gist:password@localhost:5433/gis"
  --
  --     -- auto-register this buffer with DBUI
  --     vim.api.nvim_create_autocmd("FileType", {
  --       pattern = "sql",
  --       callback = function()
  --         vim.cmd("DBUIFindBuffer") -- registers b:db ↦ this buffer  [oai_citation_attribution:0‡GitHub](https://github.com/kristijanhusak/vim-dadbod-ui/blob/master/doc/dadbod-ui.txt?utm_source=chatgpt.com)
  --       end,
  --     })
  --
  --     -- keep your execute mapping
  --     vim.keymap.set(
  --       { "n", "v" },
  --       "<leader>zz",
  --       "<Plug>(DBUI_ExecuteQuery)",
  --       { buffer = true, desc = "dadbod: run SQL under cursor/selection" }
  --     )
  --   end,
  -- },
  {
    "tpope/vim-dadbod",
    lazy = true,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = { "tpope/vim-dadbod" },
    lazy = true,
    ft = "sql", -- load on FileType=sql
    cmd = { "DBUI", "DBUIToggle", "DBUIFindBuffer" }, -- also load on these commands
    config = function()
      -- 1) whenever you open a .sql buffer, register it (and get the prompt)
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "sql",
      --   callback = function()
      --     vim.cmd("DBUIFindBuffer") -- “Select db to assign this buffer to”  [oai_citation_attribution:0‡GitHub](https://github.com/kristijanhusak/vim-dadbod-ui/blob/master/doc/dadbod-ui.txt)
      --   end,
      -- })

      -- 2) your existing execution mapping
      -- vim.keymap.set(
      --   { "n", "v" },
      --   "<leader>zz",
      --   "<Plug>(DBUI_ExecuteQuery)",
      --   { buffer = true, desc = "dadbod: run SQL under cursor/selection" }
      -- )
    end,
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-ui",
    },
    -- no extra config needed here; the plugin exposes itself as a cmp source
  },
  {
    "saghen/blink.compat",
    lazy = true,
    opts = {}, -- no extra config needed
  },

  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    dependencies = {
      "saghen/blink.compat", -- the compatibility layer
      "kristijanhusak/vim-dadbod-completion", -- your DB schema/table/column source
    },
    opts = {
      -- Override the default keymaps so that TAB confirms the current item:
      keymap = {
        -- start from the “enter” preset (arrows move, Enter confirms)
        preset = "enter",
        -- now use <Tab> to confirm instead of <CR>
        ["<Tab>"] = { "select_and_accept" }, --  [oai_citation_attribution:0‡Reddit](https://www.reddit.com/r/neovim/comments/1hfotru/nvimcmp_super_tab_in_blink/?utm_source=chatgpt.com)
        -- optionally, shift-tab to go backwards:
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      completion = {
        menu = {
          auto_show = true, -- don’t hide as you type  [oai_citation_attribution:1‡GitHub](https://github.com/Saghen/blink.cmp/issues/806?utm_source=chatgpt.com)
        },
      },

      -- 1) list your *active* completion sources
      sources = {
        default = {
          "lsp", -- LSP completions
          "path", -- filesystem paths
          "buffer", -- buffer words
          "vim-dadbod-completion", -- your DB schema/table/col source
        },

        -- 2) register how to call that last provider
        providers = {
          ["vim-dadbod-completion"] = {
            name = "vim-dadbod-completion", -- must match the string above
            module = "blink.compat.source", -- use the compat shim  [oai_citation_attribution:0‡GitHub](https://github.com/saghen/blink.compat)
            opts = {
              -- any nvim-cmp style options you’d pass to the source,
              -- e.g. { cache = true, limit = 100 }
            },
            score_offset = 200,
          },
        },
      },

      -- you can also add other top-level blink.cmp settings here
      -- like keymap, appearance, signature, etc.
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- optional, for file icons
    event = "VeryLazy", -- or whatever trigger you prefer
    config = function()
      -- either inline:
      -- require("eviline")   -- if you created lua/eviline.lua (see below)
      -- Or, if you just want to paste the example here:
      -- require("lualine").setup({ … all of your config table … })

      -- I recommend the separate-file approach:
      require("plugins.evil_lualine")
    end,
  },
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
        config = function()
          require("litee.lib").setup()
        end,
      },
    },
    config = function()
      require("litee.gh").setup({
        -- deprecated, around for compatability for now.
        jump_mode = "invoking",
        -- remap the arrow keys to resize any litee.nvim windows.
        map_resize_keys = false,
        -- do not map any keys inside any gh.nvim buffers.
        disable_keymaps = false,
        -- the icon set to use.
        icon_set = "default",
        -- any custom icons to use.
        icon_set_custom = nil,
        -- whether to register the @username and #issue_number omnifunc completion
        -- in buffers which start with .git/
        git_buffer_completion = true,
        -- defines keymaps in gh.nvim buffers.
        keymaps = {
          -- when inside a gh.nvim panel, this key will open a node if it has
          -- any futher functionality. for example, hitting <CR> on a commit node
          -- will open the commit's changed files in a new gh.nvim panel.
          open = "<CR>",
          -- when inside a gh.nvim panel, expand a collapsed node
          expand = "zo",
          -- when inside a gh.nvim panel, collpased and expanded node
          collapse = "zc",
          -- when cursor is over a "#1234" formatted issue or PR, open its details
          -- and comments in a new tab.
          goto_issue = "gd",
          -- show any details about a node, typically, this reveals commit messages
          -- and submitted review bodys.
          details = "d",
          -- inside a convo buffer, submit a comment
          submit_comment = "<C-s>",
          -- inside a convo buffer, when your cursor is ontop of a comment, open
          -- up a set of actions that can be performed.
          actions = "<C-a>",
          -- inside a thread convo buffer, resolve the thread.
          resolve_thread = "<C-r>",
          -- inside a gh.nvim panel, if possible, open the node's web URL in your
          -- browser. useful particularily for digging into external failed CI
          -- checks.
          goto_web = "gx",
        },
      })
    end,
  },
}
