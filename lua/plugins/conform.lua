local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      biome = {
        command = util.from_node_modules("biome"),
        args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
        stdin = true,
        require_cwd = true,
        cwd = util.root_file({
          "biome.json",
          "biome.jsonc",
        }),
      },
    },
  },
}
