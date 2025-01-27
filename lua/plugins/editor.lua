return {
  {
    "axelvc/template-string.nvim",
    event = "LazyFile",
    config = function()
      require("template-string").setup({
        filetypes = {
          "html",
          "typescript",
          "javascript",
          "typescriptreact",
          "javascriptreact",
          "vue",
          "svelte",
        }, -- filetypes where the plugin is active
        jsx_brackets = true, -- must add brackets to JSX attributes
        remove_template_string = false, -- remove backticks when there are no template strings
        restore_quotes = {
          -- quotes used when "remove_template_string" option is enabled
          normal = [[']],
          jsx = [["]],
        },
      })
    end,
  },
  -- {
  --   "saghen/blink.cmp",
  --   optional = true,
  --   specs = {
  --     {
  --       "zbirenbaum/copilot.lua",
  --       event = "InsertEnter",
  --       opts = {
  --         suggestion = {
  --           enabled = true,
  --           auto_trigger = true,
  --           keymap = { accept = false },
  --         },
  --       },
  --     },
  --   },
  --   ---@module 'blink.cmp'
  --   ---@type blink.cmp.Config
  --   opts = {
  --     windows = {
  --       autocomplete = {
  --         border = "rounded",
  --       },
  --       ghost_text = {
  --         enabled = false,
  --       },
  --       documentation = {
  --         max_width = 80,
  --       },
  --       signaturure_help = {
  --         max_width = 80,
  --       },
  --     },
  --     keymap = {
  --       ["<Tab>"] = {
  --         function(cmp)
  --           if cmp.is_in_snippet() then
  --             return cmp.accept()
  --           elseif require("copilot.suggestion").is_visible() then
  --             LazyVim.create_undo()
  --             require("copilot.suggestion").accept()
  --             return true
  --           else
  --             return cmp.select_and_accept()
  --           end
  --         end,
  --         "snippet_forward",
  --         "fallback",
  --       },
  --     },
  --   },
  -- },
  {
    "styled-components/vim-styled-components",
    enabled = true,
    lazy = true,
    event = "LazyFile",
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    lazy = false,
    priority = 1000,
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
    "onsails/lspkind.nvim",
    lazy = false,
    priority = 100,
  },
  {
    "hrsh7th/nvim-cmp",
    ---module 'nvim-cmp'
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      opts.experimental = {
        ghost_text = false,
      }
      opts.window = {
        completion = {
          border = "rounded",
          winblend = 1,
          winhighlight = "Normal:BlinkMenu,FloatBorder:BlinkBorder,CursorLine:BlinkSelection",
          col_offset = -3,
          side_padding = 0,
          scrollbar = false,
        },
        documentation = {
          border = "rounded",
          max_width = 80,
          max_height = 60,
          winblend = 1,
          winhighlight = "Normal:BlinkMenu,FloatBorder:BlinkBorder,Search:None",
        },
      }

      opts.formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      }
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
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    event = { "LazyFile" }, -- optional for lazy loading on trigger events
    opts = {
      nabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
      trigger_events = { -- See :h events
        immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
        defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
        cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
      },
      condition = nil,
      write_all_buffers = true, -- write all buffers when the current one meets `condition`
      noautocmd = false, -- do not execute autocmds when saving
      debounce_delay = 20000, -- delay after which a pending save is executed
      debug = false,
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    },
  },
  {
    "f-person/git-blame.nvim",
    event = "LazyFile",
    opts = {
      enabled = false,
    },
  },
  -- {
  --   "nmac427/guess-indent.nvim",
  --   event = "LazyFile",
  --   config = function()
  --     require("guess-indent").setup({
  --       auto_cmd = true, -- Set to false to disable automatic execution
  --       override_editorconfig = false, -- Set to true to override settings set by .editorconfig
  --       buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
  --         "help",
  --         "nofile",
  --         "terminal",
  --         "prompt",
  --       },
  --       on_tab_options = { -- A table of vim options when tabs are detected
  --         ["expandtab"] = false,
  --       },
  --       on_space_options = { -- A table of vim options when spaces are detected
  --         ["expandtab"] = true,
  --         ["tabstop"] = "detected", -- If the option value is 'detected', The value is set to the automatically detected indent size.
  --         ["softtabstop"] = "detected",
  --         ["shiftwidth"] = "detected",
  --       },
  --     })
  --   end,
  -- },
}
