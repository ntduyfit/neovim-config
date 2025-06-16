return {
  {
    "folke/noice.nvim",
    enabled = true,
    opts = {
      messages = {
        enabled = true,
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            kind = "",
            find = "written",
          },
          opts = { skip = true },
        },
        {
          view = "notify",
          filter = { event = "msg_show", kind = "" },
          opts = { skip = true },
        },
      },
      lsp = {
        progress = {
          enabled = true,
        },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      refresh = {
        statusline = 1500,
        tabline = 1500,
        winbar = 1500,
      },
      options = {
        theme = "catppuccin",
      },
    },
  },
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   opts = {
  --     default_component_configs = {
  --       indent = {
  --         indent_size = 1,
  --         with_markers = false,
  --       },
  --     },
  --   },
  -- },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    enabled = true,
    init = false,
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]
      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },
}
