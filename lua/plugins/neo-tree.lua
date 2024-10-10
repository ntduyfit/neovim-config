return {
  "nvim-neo-tree/neo-tree.nvim",
  keys = {
    {
      "<leader>ee",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<leader>be",
      function()
        require("neo-tree.command").execute({ toggle = false, reveal_file = vim.api.nvim_buf_get_name(0), reveal_force_cwd = true })
      end,
      desc = "Reveal",
    },

  },
  opts = {
    buffers = {
      bind_to_cwd = true,
    },
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = false },
      filtered_items = {
        visible = true,
        show_hidden_count = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
          "thumbs.db",
          ".idea",
        },
        never_show = {},
      },
    },
    default_component_configs = {
      indent = {
        indent_marker = "│",
      },
    },
  },
}
