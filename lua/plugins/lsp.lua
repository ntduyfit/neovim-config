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
      -- omnisharp = function(_, opts)
      --   opt.
      -- end,
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
      tsgo = function(_, opts)
        local lspconfig = require("lspconfig")
        local configs = require("lspconfig.configs")

        if not configs.tsgo then
          configs.tsgo = {
            default_config = {
              cmd = opts.cmd,
              filetypes = opts.filetypes,
              root_dir = opts.root_dir,
              settings = opts.settings or {},
            },
          }
        end

        lspconfig.tsgo.setup(opts)
        return true
      end,
    },
    servers = {
      omnisharp = {
        cmd = { "dotnet", "/Users/ntduyfit/.omnisharp/bin/OmniSharp.dll" },

        -- handlers = {
        --   ["textDocument/definition"] = function(...)
        --     return require("omnisharp_extended").handler(...)
        --   end,
        -- },

        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
        enable_import_completion = true,
      },
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
      tsgo = {
        enabled = false,
        mason = false,
        cmd = { "tsgo", "--lsp", "--stdio" },
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        root_dir = require("lspconfig.util").root_pattern(
          "tsconfig.json",
          "jsconfig.json",
          "package.json",
          ".git",
          "tsconfig.base.json"
        ),
        init_options = {
          provideFormatter = false,
        },
        settings = {
          typescript = {
            format = {
              enabled = false,
            },
          },
        },
      },
    },
  },
}
