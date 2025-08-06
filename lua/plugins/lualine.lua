return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, { "lsp_status", color = { fg = Snacks.util.color("DiagnosticInfo") } })
    table.insert(opts.sections.lualine_c, {
      "searchcount",
      colored = true,
      separator = { left = "" },
      color = {
        fg = Snacks.util.color("Constant"),
      },
    })
    return opts
  end,
}
