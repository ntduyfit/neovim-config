return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        hidden = true,
        ignored = true,
        exclude = {
          "**/node_modules/*",
          "node_modules",
          ".idea",
          "**/build/*",
          "**/dist/*",
          "**/.next/*",
        },
      },
      indent = {
        indent = {
          enabled = true,
          priority = 1,
          char = "▏",
        },
        scope = {
          enabled = true,
          priority = 200,
          char = "▏",
          only_current = false,
          hl = {
            "SnackIndentBlue",
            "SnackIndentLavender",
            "SnackIndentSapphire",
            "SnackIndentSky",
            "SnackIndentGreen",
            "SnackIndentTeal",
            "SnackIndentYellow",
            "SnackIndentPeach",
            "SnackIndentMaroon",
            "SnackIndentRed",
            "SnackIndentPink",
            "SnackIndentMauve",
            "SnackIndentFlamingo",
          },
        },
      },
    },
    keys = {
      {
        "<leader>o",
        function()
          local explorer_pickers = Snacks.picker.get({ source = "explorer" })
          if #explorer_pickers == 0 then
            Snacks.picker.explorer()
          -- elseif explorer_pickers[1]:is_focused() then
          -- 	explorer_pickers[1]:close()
          else
            if not explorer_pickers[1]:is_focused() then
              explorer_pickers[1]:focus()
            else
              vim.cmd("normal! <C-w>h")
            end
          end
        end,
        desc = "Buffers",
      },
      {
        "<leader><space>",
        LazyVim.pick("files", {
          root = false,
          hidden = true,
          ignored = true,
          exclude = {
            "**/node_modules/*",
            "node_modules",
            ".idea",
            "**/build/*",
            "**/dist/*",
            "**/.next/*",
          },
        }),
        desc = "Find Files (cwd)",
      },
      {
        "<leader>fF",
        LazyVim.pick("files", {
          exclude = {
            "**/node_modules/*",
            "node_modules",
            ".idea",
            "**/build/*",
            "**/dist/*",
            "**/.next/*",
          },
        }),
        desc = "Find Files (Root Dir)",
      },
      {
        "<leader>/",
        LazyVim.pick("grep", {
          root = false,
          exclude = {
            "**/node_modules/*",
            "node_modules",
            ".idea",
            "**/build/*",
            "**/dist/*",
            "**/.next/*",
          },
        }),
        desc = "Grep (Root Dir)",
      },
      {
        "<leader>e",
        function()
          Snacks.picker.explorer({
            hidden = true,
            ignored = true,
            exclude = {
              "**/build/*",
              "**/dist/*",
              "**/.next/*",
            },
          })
        end,
        desc = "Explorer",
      },
    },
  },
}
