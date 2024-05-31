local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "plugins" },
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        table.insert(opts.ensure_installed, "prettier")
      end,
    },
    {
      "styled-components/vim-styled-components",
      enabled = true,
      lazy = true,
      event = "BufAdd",
    },
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = true,
      lazy = false,
      priority = 1000,
    },
    {
      "HiPhish/rainbow-delimiters.nvim",
      event = "BufAdd",
      init = function()
        vim.g.rainbow_delimeters = {
          highlight = {
            "RainbowDelimiterRed",
            "RainbowDelimiterYellow",
            "RainbowDelimiterBlue",
            "RainbowDelimiterOrange",
            "RainbowDelimiterGreen",
            "RainbowDelimiterViolet",
            "RainbowDelimiterCyan",
          },
        }
      end,
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
      keys = function()
        return {}
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      ---@param opts cmp.ConfigSchema
      opts = function(_, opts)
        local has_words_before = function()
          unpack = unpack or table.unpack
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end

        local luasnip = require("luasnip")
        local cmp = require("cmp")
        local copilot = require("copilot.suggestion")

        opts.mapping = vim.tbl_extend("force", opts.mapping, {
          ["<Tab>"] = cmp.mapping(function(fallback)
            if copilot.is_visible() then
              copilot.accept_line()
            elseif cmp.visible() then
              -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
              cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        })
      end,
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      opts = {
        suggestion = { enabled = true, auto_trigger = true },

        panel = { enabled = false },
      },
    },
    {
      "okuuva/auto-save.nvim",
      cmd = "ASToggle", -- optional for lazy loading on command
      event = { "LazyFile" }, -- optional for lazy loading on trigger events
      opts = {
        enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
        execution_message = {
          enabled = false,
        },
        trigger_events = { -- See :h events
          immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
          defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
          cancel_defered_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
        },
        condition = nil,
        write_all_buffers = false, -- write all buffers when the current one meets `condition`
        noautocmd = false, -- do not execute autocmds when saving
        debounce_delay = 20000, -- delay after which a pending save is executed
        debug = false,
      },
    },
    {
      "windwp/nvim-ts-autotag",
      event = "LazyFile",
      opts = {},
    },
    {
      "f-person/git-blame.nvim",
      event = "LazyFile",
    },
  },
  colorscheme = "catppuccin",
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
