return {
  "olimorris/codecompanion.nvim",
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = {
          name = "copilot",
          model = "claude-sonnet-4",
        },
      },
      inline = {
        adapter = "copilot",
      },
      cmd = {
        adapter = "copilot",
      },
    },
  },
}
