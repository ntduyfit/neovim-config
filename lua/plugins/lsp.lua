return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    codelens = {
      enabled = true,
    },
    -- make sure mason installs the server
    servers = {
      ---@type lspconfig.options.tsserver
      tsserver = {
        keys = {
          {
            "<M-D-o>",
            function()
              vim.lsp.buf.code_action({
                apply = true,
                context = {
                  only = { "source.organizeImports" },
                  diagnostics = {},
                },
              })
            end,
            desc = "Organize Imports",
          },
        },
        ---@diagnostic disable-next-line: missing-fields
        settings = {
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
    },
  },
}
