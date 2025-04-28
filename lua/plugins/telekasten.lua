-- ~/.config/nvim/lua/plugins/telekasten.lua
return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    -- load on these commands (or on startup if you want)
    cmd = {
      "Telekasten",
      "TelekastenEdit",
      "TelekastenFollowLink",
      "TelekastenShowCalendar",
      "TelekastenSearchNotes",
    },
    config = function()
      local home = vim.fn.expand("~/dev/MTA-RT-app/notes/") -- change this to your notes dir
      require("telekasten").setup({
        home = home,
        -- sub-directories (relative to home)
        dailies = home .. "/daily",
        weeklies = home .. "/weekly",
        templates = home .. "/templates",
        -- default file extension
        extension = ".md",

        -- New note filename template
        -- e.g. "20250427-1234.md" or "{{title}}.md"
        new_note_filename = "{{date}}-{{slug}}",

        -- Whether to automatically create missing subdirs
        -- (dailies, weeklies, templates)
        auto_create = true,

        -- How to preview images pasted from clipboard
        -- "telescope-media-files" or your own command
        media_previewer = "telescope-media-files",

        -- Follow [[WikiLinks]] with CTRL mouse click
        follow_creates_nonexisting = true,
        template_new_note = home .. "/templates/default.md",

        -- Style of the link in markdown notes
        -- "[[link]]" or "![[image.png]]"
        -- defaults to "[[title]]"
        link_style = "markdown",

        -- Key mappings specific to telekasten
        -- Feel free to customize these!
        -- mappings = {
        --   panel = "<leader>z", -- launch the Telekasten panel
        --   find_notes = "<leader>zf",
        --   search_notes = "<leader>zg",
        --   new_note = "<leader>zn",
        --   follow_link = "<leader>zl",
        --   goto_today = "<leader>zd",
        --   show_calendar = "<leader>zC",
        --   show_backlinks = "<leader>zb",
        --   insert_img_link = "<leader>zi",
        --   insert_link = { "i", "[[" },
        -- },
      })
    end,
  },
  {
    "nvim-telekasten/calendar-vim",
    lazy = true,
    cmd = { "Calendar", "CalendarT", "CalendarVR", "CalendarVL" },
  },
}
