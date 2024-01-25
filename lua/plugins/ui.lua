return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- init = function()
    --   local highlight = {
    --     "RainbowRed",
    --     "RainbowYellow",
    --     "RainbowBlue",
    --     "RainbowOrange",
    --     "RainbowGreen",
    --     "RainbowViolet",
    --     "RainbowCyan",
    --   }
    --   local hooks = require("ibl.hooks")
    --   hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    --     vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    --     vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    --     vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    --     vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    --     vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    --     vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    --     vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    --   end)
    --
    --   vim.g.rainbow_delimiters = { highlight = highlight }
    --   require("ibl").setup({
    --     scope = { enabled = false },
    --     indent = {
    --       char = "▏",
    --       tab_char = "▏",
    --       highlight = highlight,
    --     },
    --     exclude = {
    --       filetypes = {
    --         "help",
    --         "alpha",
    --         "dashboard",
    --         "neo-tree",
    --         "Trouble",
    --         "trouble",
    --         "lazy",
    --         "mason",
    --         "notify",
    --         "toggleterm",
    --         "lazyterm",
    --       },
    --     },
    --   })
    --
    --   hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    -- end,
    opts = {

      scope = { enabled = false },
      indent = {
        char = "▏",
        tab_char = "▏",
      },
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
      symbol = "▏",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
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
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
