return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = {
      enabled = false,
    },
    diagnostics = {
      float = {
        enabled = true,
        border = "rounded",
      },
      virtual_text = false,
    },
    setup = {
      tailwindcss = function(_, opts)
        opts.settings = {
          tailwindCSS = {
            classAttributes = { "class", "className", "ngClass", "class:list", "icon" },
            experimental = {
              classRegex = {
                "className\\:\\s*'([^']*)'",
                "icon\\:\\s*'([^']*)'",
              },
            },
          },
        }
      end,
      ["helm-ls"] = function(_, opts)
        opts.settings = {
          ["helm-ls"] = {
            yamlls = {
              path = "yaml-language-server",
            },
          },
        }
      end,
    },
    servers = {
      vtsls = {
        settings = {
          typescript = {
            preferGoToSourceDefinition = {
              enabled = false,
            },
            inlayHints = {
              parameterTypes = { enabled = false },
              parameterNames = { suppressWhenArgumentMatchesName = true, enabled = "literals" },
              typeHints = { enabled = false },
              functionLikeReturnTypes = { enabled = false },
              variableTypes = { enabled = false },
            },
          },
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@styled/typescript-styled-plugin",
                  location = "/Users/ntduyfit/.nvm/versions/node/v20.14.0/lib/node_modules",
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
