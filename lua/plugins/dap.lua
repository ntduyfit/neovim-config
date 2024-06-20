return {
  {
    "Cliffback/netcoredbg-macOS-arm64.nvim",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = false,
    priority = 10000,
    config = function()
      require("netcoredbg-macOS-arm64").setup(require("dap"))
    end,
  },
}
