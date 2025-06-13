return {
  {
    "windwp/nvim-ts-autotag",
    event = "LazyFile",
    enabled = true,
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = true, -- Auto close on trailing </
        },
      })
    end,
  },
  {
    "axelvc/template-string.nvim",
    enabled = true,
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
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      fuzzy = {
        implementation = "rust",
      },
      appearance = {
        use_nvim_cmp_as_default = false,
      },
      signature = {
        window = {
          winblend = 0,
          border = "rounded",
          scrollbar = false,
          max_height = 20,
          max_width = 40,
        },
      },
      completion = {
        accept = { auto_brackets = { enabled = false } },
        ghost_text = { enabled = false },
        list = {
          max_items = 40,
          selection = {
            preselect = true,
            auto_insert = false,
          },
          cycle = {
            from_bottom = false,
            from_top = false,
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
          window = {
            winblend = 0,
            border = "rounded",
            scrollbar = false,
          },
        },
        ---@type blink.cmp.CompletionMenuConfigPartial
        menu = {
          auto_show = true,
          winblend = 0,
          border = "rounded",
          min_width = 20,
          max_height = 12,

          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                -- Optionally, use the highlight groups from nvim-web-devicons
                -- You can also add the same function for `kind.highlight` if you want to
                -- keep the highlight groups in sync with the icons.
                highlight = function(ctx)
                  local hl = ctx.kind_hl
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
            columns = {
              { "label", "label_description", gap = 2 },
              { "kind_icon", "kind", gap = 1 },
            },
          },
        },
      },
      -- snippets = { preset = "luasnip" },
      -- ensure you have the `snippets` source (enabled by default)
      sources = {
        default = { "snippets", "lsp", "buffer", "path" },
      },
      keymap = {
        ["<Tab>"] = {
          function(cmp)
            local copilot = require("copilot.suggestion")
            local luasnip = require("luasnip")

            if copilot.is_visible() then
              copilot.accept_line()
              return true
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
              return true
            elseif cmp.is_visible() then
              cmp.select_next()
              return true
            end
          end,
          "fallback",
        },
      },
    },
  },
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
    event = "VeryLazy",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true, auto_trigger = true },
      panel = { enabled = false },
      filetypes = {
        yaml = true,
        markdown = true,
        gitcommit = true,
      },
    },
  },
  {
    "onsails/lspkind.nvim",
    lazy = false,
    priority = 100,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   ---module 'nvim-cmp'
  --   ---@param opts
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "emoji" })
  --     opts.performance = {
  --       max_view_entries = 14,
  --       debounce = 300,
  --       throttle = 200,
  --     }
  --     opts.experimental = {
  --       ghost_text = false,
  --     }
  --     opts.window = {
  --       completion = {
  --         border = "rounded",
  --         winblend = 1,
  --         winhighlight = "Normal:BlinkMenu,FloatBorder:BlinkBorder,CursorLine:BlinkSelection",
  --         col_offset = -3,
  --         side_padding = 0,
  --         scrollbar = false,
  --       },
  --       documentation = {
  --         border = "rounded",
  --         max_width = 80,
  --         max_height = 60,
  --         winblend = 1,
  --         winhighlight = "Normal:BlinkMenu,FloatBorder:BlinkBorder,Search:None",
  --       },
  --     }
  --
  --     opts.formatting = {
  --       fields = { "kind", "abbr", "menu" },
  --       format = function(entry, vim_item)
  --         local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
  --         local strings = vim.split(kind.kind, "%s", { trimempty = true })
  --         kind.kind = " " .. (strings[1] or "") .. " "
  --         kind.menu = "    (" .. (strings[2] or "") .. ")"
  --
  --         return kind
  --       end,
  --     }
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end
  --
  --     local luasnip = require("luasnip")
  --     local cmp = require("cmp")
  --     local copilot = require("copilot.suggestion")
  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if copilot.is_visible() then
  --           copilot.accept_line()
  --         elseif cmp.visible() then
  --           -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
  --           cmp.select_next_item()
  --           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  --           -- this way you will only jump inside the snippet region
  --         elseif luasnip.expand_or_jumpable() then
  --           luasnip.expand_or_jump()
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif luasnip.jumpable(-1) then
  --           luasnip.jump(-1)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "LazyFile" }, -- optional for lazy loading on trigger events
    opts = {
      enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
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
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
