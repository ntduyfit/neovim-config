return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    codelens = {
      enabled = false,
    },
    ---@type vim.diagnostic.Opts
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
      omnisharp = {},
      vtsls = {
        enabled = true,
        settings = {
          tsserver = {
            maxTsServerMemory = 8192,
          },
          typescript = {
            preferences = {
              importModuleSpecifierEnding = "minimal",
              importModuleSpecifier = "shortest",
              autoImportUseTypeOnly = true,
              renameMatchingJsxTags = true,
              preferTypeOnlyAutoImports = true,
              renameMatchingTsxTags = true,
            },
            tsserver = {
              maxTsServerMemory = 8192,
            },
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
            autoUseWorkspaceTsdk = true,
            experimental = {
              maxInlayHintLength = 6,
              completion = {
                enableServerSideFuzzyMatch = true,
                entriesLimit = 10,
              },
            },
            tsserver = {
              globalPlugins = {
                {
                  name = "@styled/typescript-styled-plugin",
                  location = "/Users/ntduyfit/.nvm/versions/node/v20.14.0/lib/node_modules",
                  enableForWorkspaceTypeScriptVersions = true,
                },
                {
                  name = "@vue/typescript-plugin",
                  location = "/usr/local/lib/node_modules/@vue/language-server",
                  languages = { "vue" },
                },
              },
            },
          },
        },
      },
    },
  },
}
