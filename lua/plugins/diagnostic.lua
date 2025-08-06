return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "LspAttach", -- Or `LspAttach`
  priority = 1000, -- needs to be loaded in first
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "amongus",
      hi = {
        error = "DiagnosticError", -- Highlight group for error messages
        warn = "DiagnosticWarn", -- Highlight group for warning messages
        info = "DiagnosticInfo", -- Highlight group for informational messages
        hint = "DiagnosticHint", -- Highlight group for hint or suggestion messages

        -- Background color for diagnostics
        -- Can be a highlight group or a hexadecimal color (#RRGGBB)
        background = "None",

        -- Color blending option for the diagnostic background
        -- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
        mixing_color = "None", -- Default is black
      },
    })
    -- vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
  end,
}
