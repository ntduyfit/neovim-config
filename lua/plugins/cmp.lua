return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-emoji" },
  opts = function(_, opts)
    table.insert(opts.sources, { name = "emoji" })
    -- opts.performance = {
    --   -- max_view_entries = 14,
    --   debounce = 300,
    --   throttle = 200,
    -- }
  end,
}
