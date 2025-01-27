return {
  {
    "nordtheme/vim",
    enabled = false,
    lazy = false,
    priority = 1000,
  },
  {
    "rmehri01/onenord.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function() end,
  },

  {
    "AlexvZyl/nordic.nvim",
    enabled = false,
    priority = 1000,
    config = function()
      require("nordic").setup({
        transparent_bg = true,
      })

      require("nordic").load()
    end,
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
    "navarasu/onedark.nvim",
    enabled = false,
    opts = {
      style = "darker", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = true, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- toggle theme style ---
      toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },

      -- Lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- Custom Highlights --
      colors = {}, -- Override default colors
      highlights = {}, -- Override highlight groups

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    },
    init = function()
      require("notify").setup({
        background_colour = "#282c34",
      })
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    enabled = true,
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
        indent_blankline = { enabled = true, scope_color = "lavender" },
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
            ["MiniIndentscopeSymbol"] = { fg = macchiato.overlay1 },
            ["DiagnosticUnnecessary"] = { fg = macchiato.blue },
            ["@constant.bash"] = { fg = macchiato.blue },
            ["@property.json"] = { fg = macchiato.blue },
            ["CursorLine"] = { bg = macchiato.surface0 },
            ["Visual"] = { bg = macchiato.surface2, style = {} },
            ["LspReferenceWrite"] = { bg = macchiato.surface0 },
            ["LspReferenceText"] = { bg = macchiato.surface0 },
            ["@lsp.type.parameter.typescript"] = { fg = macchiato.peach },
            ["Cursor"] = { bg = macchiato.flamingo },
            ["BlinkSelection"] = { bg = macchiato.mauve, fg = macchiato.base },
            ["BlinkMenu"] = { bg = macchiato.surface0, blend = 2 },
            ["BlinkBorder"] = { fg = macchiato.flamingo, bg = macchiato.surface0, blend = 1 },
          }
        end,
      },
    },
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    enabled = false,
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        terminal_colors = true,
        devicons = true, -- highlight the icons of `nvim-web-devicons`
        styles = {
          comment = { italic = true },
          keyword = { italic = true }, -- any other keyword
          type = { italic = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = true }, -- static, register, volatile, etc
          structure = { italic = true }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        },
        filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
        -- Enable this will disable filter option
        day_night = {
          enable = false, -- turn off by default
          day_filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
          night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
        },
        inc_search = "background", -- underline |
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = true,
          operators = false,
          folds = false,
        },
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        dim_inactive = true,
        transparent_mode = true,
      })
    end,
    enabled = false,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_statusline_style = "mix"
    end,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = "hard"
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_foreground = "colored"
      vim.g.everforest_enable_bold = 1
      vim.g.everforest_statusline_style = "mix"
      vim.g.everforest_better_performance = 1
      vim.g.eveerforest_diagnostic_text_highlight = 1
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        background = "hard",
        italics = false,
        disable_italic_comments = false,
        sign_column_background = "none",
        transparent_background_level = 2,
        dim_inactive_windows = false,
        diagnostic_line_highlight = false,
        diagnostic_virtual_text = "coloured",
        diagnostic_text_highlight = true,
        float_style = "bright",
        spell_foreground = false,
        inlay_hints_background = "none",
        ui_contrast = "low",
        colours_override = function() end,
        show_eob = false,
        on_highlights = function(hl, palette)
          hl.TSVariable = { fg = palette.blue }
        end,
      })
    end,
  },
}
