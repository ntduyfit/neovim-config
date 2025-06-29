return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    enabled = false,
    -- opts = {
    --   style = "moon",
    --   transparent = true,
    --   ---@module "tokyonight",
    --   ---@param highlights tokyonight.Highlights
    --   ---@param colors ColorScheme
    --   on_highlights = function(highlights, colors)
    --     highlights.NormalFloat = { bg = "none" }
    --     highlights.SnacksPickerBoxTitle = { fg = colors.orange, bg = "none" }
    --     highlights.SnacksPickerBorder = { fg = colors.blue2, bg = "none" }
    --     highlights.SnacksPickerCode = { fg = "#82aaff", bg = "none" }
    --     highlights.FloatTitle = { fg = colors.blue2, bg = "none" }
    --     highlights.SnacksPickerInputBorder = { fg = colors.blue, bg = "none" }
    --     highlights.SnacksPickerInputTitle = { fg = colors.orange, bg = "none" }
    --     highlights.SnacksPickerPathHidden = { fg = colors.fg_sidebar }
    --
    --     highlights["SnackIndentBlue"] = { fg = colors.blue2 }
    --     highlights["SnackIndentLavender"] = { fg = colors.green2 }
    --     highlights["SnackIndentSapphire"] = { fg = colors.blue5 }
    --     highlights["SnackIndentSky"] = { fg = colors.blue6 }
    --     highlights["SnackIndentGreen"] = { fg = colors.green }
    --     highlights["SnackIndentTeal"] = { fg = colors.green1 }
    --     highlights["SnackIndentYellow"] = { fg = colors.yellow }
    --     highlights["SnackIndentPeach"] = { fg = colors.orange }
    --     highlights["SnackIndentMaroon"] = { fg = colors.green1 }
    --     highlights["SnackIndentRed"] = { fg = colors.red1 }
    --     highlights["SnackIndentPink"] = { fg = colors.purple }
    --     highlights["SnackIndentMauve"] = { fg = colors.cyan }
    --     highlights["SnackIndentFlamingo"] = { fg = colors.magenta }
    --     highlights["SnacksIndent"] = { fg = colors.fg_gutter }
    --
    --     highlights["BlinkCmpMenu"] = { bg = "none", fg = colors.fg_float }
    --     highlights["BlinkCmpMenuBorder"] = { bg = "none", fg = colors.blue7 }
    --
    --     highlights["BlinkCmpMenuSelection"] = { bg = colors.green, fg = colors.bg }
    --     highlights["BlinkCmpScrollBarThumb"] = {
    --       bg = colors.green,
    --     }
    --     highlights["BlinkCmpSignatureHelp"] = { bg = "none" }
    --     highlights["BlinkCmpSignatureHelpBorder"] = { fg = colors.blue7, bg = "none" }
    --     highlights["BlinkCmpDoc"] = { bg = "none", blend = 5 }
    --     highlights["BlinkCmpDocBorder"] = { fg = colors.blue7, bg = "none" }
    --   end,
    -- },
  },
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
      background = {
        dark = "macchiato",
        light = "latte",
      },
      transparent_background = true,
      term_colors = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        grug_far = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = false, scope_color = "lavender" },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          inlay_hints = {
            background = true,
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        blink_cmp = true,
      },
      highlight_overrides = {
        macchiato = function(macchiato)
          return {
            ["@variable.member"] = { fg = macchiato.blue },
            ["@variable"] = { fg = macchiato.yellow },
            ["@constructor.typescript"] = { fg = macchiato.peach },
            ["@type"] = { fg = macchiato.yellow },
            ["@type.builtin"] = { fg = macchiato.peach },
            ["@tag"] = { fg = macchiato.blue },
            ["@tag.builtin.tsx"] = { fg = macchiato.blue },
            ["@lsp.type.property"] = { fg = macchiato.blue },
            ["@tag.delimiter"] = { fg = macchiato.blue },
            ["@tag.attribute.tsx"] = { fg = macchiato.yellow, style = {} },
            ["@lsp.type.interface.typescript"] = { fg = macchiato.yellow },
            ["@lsp.type.interface.typescriptreact"] = { fg = macchiato.peach },
            ["@string.special.url.tsx"] = { fg = macchiato.green, style = { "underline" } },
            ["@attribute.typescript"] = { fg = macchiato.maroon },
            ["@function"] = { fg = macchiato.maroon },
            ["@lsp.function.typescript"] = { link = "@function" },
            ["@lsp.type.parameter.typescriptreact"] = { link = "@constant" },
            ["@module"] = { fg = macchiato.maroon, style = {} },
            ["@property.yaml"] = { fg = macchiato.blue },
            ["@punctuation.bracket"] = { fg = macchiato.lavender },
            ["@property.styled"] = { link = "@lsp.type.property" },
            ["@property.class.styled"] = { link = "@variable" },
            ["@spell.tsx"] = { fg = macchiato.lavender },
            -- ["MiniIndentscopeSymbol"] = { fg = macchiato.overlay1 },
            ["DiagnosticUnnecessary"] = { fg = macchiato.blue },
            ["@constant.bash"] = { fg = macchiato.blue },
            ["@property.json"] = { fg = macchiato.blue },
            ["@property.jsonc"] = { fg = macchiato.blue },
            ["CursorLine"] = { bg = macchiato.base },
            ["Visual"] = { bg = macchiato.surface2, style = {} },
            ["LspReferenceWrite"] = { bg = macchiato.surface0 },
            ["LspReferenceText"] = { bg = macchiato.surface0 },
            ["@lsp.type.parameter.typescript"] = { fg = macchiato.peach },
            ["Cursor"] = { bg = macchiato.flamingo },
            ["BlinkCmpMenuSelection"] = { bg = macchiato.green, fg = macchiato.surface0 },
            ["BlinkCmpMenu"] = { bg = "none", link = "none" },
            ["BlinkCmpMenuBorder"] = { fg = macchiato.lavender, bg = "none" },
            ["NeominimapCursorLine"] = { bg = "none" },
            ["BlinkCmpScrollBarThumb"] = {
              bg = macchiato.pink,
            },
            ["BlinkCmpSignatureHelp"] = { bg = "none" },
            ["BlinkCmpSignatureHelpBorder"] = { fg = macchiato.flamingo, bg = "none" },
            ["BlinkCmpDoc"] = { bg = "none" },
            ["BlinkCmpDocBorder"] = { fg = macchiato.flamingo, bg = "none" },

            ["SnackIndentBlue"] = { fg = macchiato.blue },
            ["BlinkIndentLavender"] = { fg = macchiato.lavender },
            ["BlinkIndentSapphire"] = { fg = macchiato.sapphire },
            ["BlinkIndentSky"] = { fg = macchiato.sky },
            ["BlinkIndentGreen"] = { fg = macchiato.green },
            ["BlinkIndentTeal"] = { fg = macchiato.teal },
            ["BlinkIndentYellow"] = { fg = macchiato.yellow },
            ["BlinkIndentPeach"] = { fg = macchiato.peach },
            ["BlinkIndentMaroon"] = { fg = macchiato.maroon },
            ["BlinkIndentRed"] = { fg = macchiato.red },
            ["BlinkIndentPink"] = { fg = macchiato.pink },
            ["BlinkIndentMauve"] = { fg = macchiato.mauve },
            ["BlinkIndentFlamingo"] = { fg = macchiato.flamingo },
            ["SnacksIndent"] = { fg = macchiato.surface1 },
            ["SnacksPicker"] = { bg = "none" },
            -- ["SnacksPickerBorder"] = { fg = macchiato.lavender, bg = "none" },
            ["FloatTitle"] = { fg = macchiato.blue, bg = "none" },
            ["SnacksPickerBoxTitle"] = { fg = macchiato.blue, bg = "none" },
            ["SnacksPickerInputBorder"] = { fg = macchiato.blue, bg = "none" },
            ["SnacksPickerInputTitle"] = { fg = macchiato.orange, bg = "none" },
            ["SnacksPickerPathHidden"] = { fg = macchiato.subtext1 },
            ["SnacksPickerFile"] = { fg = macchiato.lavender },
            ["SnacksPickerCursorLine"] = { bg = macchiato.surface0, fg = macchiato.green },
            ["SnacksPickerListCursorLine"] = { bg = macchiato.surface0, fg = macchiato.green },
            ["SnacksPickerListBorder"] = { bg = "none", fg = macchiato.blue },
            ["SnacksPickerBorder"] = { bg = "none", fg = macchiato.blue },
            ["NormalSB"] = { bg = "none" },
            ["Normal"] = { bg = "none" },
            ["FloatBorder"] = { bg = "none" },
            ["NormalFloat"] = { bg = "none" },
            ["NoiceFormatProgressDone"] = { bg = macchiato.blue, fg = macchiato.base },
            ["NoiceFormatProgressTodo"] = { fg = macchiato.lavender },
          }
        end,
      },
    },
  },
}
