return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {
        keys = {
          { "<D-A-o>", "<cmd>TypescriptOrganizeImports<CR>", desc = "Organize Imports" },
        },
      },
    },
  },
}
