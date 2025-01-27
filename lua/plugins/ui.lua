return {
  {
    "gorbit99/codewindow.nvim",
    enabled = false,
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({
        auto_enable = true,
        minimap_width = 10,
        width_multiplier = 2,
        window_border = "none",
        screen_bounds = "background",
        relative = "editor",
        show_cursor = false,
      })
      vim.api.nvim_set_hl(0, "CodewindowBackground", { bg = "#24273a" })
      vim.api.nvim_set_hl(0, "CodewindowBoundsBackground", { bg = "#363a4f" })

      codewindow.apply_default_keybinds()
    end,
    lazy = true,
    event = "LazyFile",
  },

  {
    "folke/noice.nvim",
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
          enabled = false,
        },
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      local highlight = { "foreground" }

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "foreground", { fg = "#494d64" })
      end)

      return {
        indent = {
          char = "▏",
          tab_char = "▏",
          highlight = highlight,
        },
        whitespace = {
          remove_blankline_trail = false,
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
      }
    end,
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
        delay = 50,
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
  {
    "rcarriga/nvim-notify",
    opts = {},
  },
}
