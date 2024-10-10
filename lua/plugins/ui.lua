return {
  -- {
  --   'gorbit99/codewindow.nvim',
  --   config = function()
  --     local codewindow = require('codewindow')
  --     codewindow.setup({
  --       auto_enable = true,
  --       minimap_width = 5,
  --       width_multiplier = 4,
  --     })
  --     codewindow.apply_default_keybinds()
  --   end,
  --   lazy = true,
  --   event = 'LazyFile',
  --   enabled = true
  -- },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "▏",
        tab_char = "▏",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    event = "LazyFile",
    main = "ibl",
    enabled = true,
  },
  {
    "echasnovski/mini.indentscope",
    enabled = true,
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "LazyFile",
    opts = {
      -- symbol = "▏",
      draw = {
        delay = 50
      },
      symbol = "▏",
      options = { try_as_border = true },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      default_component_configs = {
        indent = {
          indent_size = 1,
          with_markers = false,
        },
      },
    },
  },
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
