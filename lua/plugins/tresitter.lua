return {
  "windwp/nvim-ts-autotag",
  lazy = true,
  event = "BufReadPre",
  opts = {
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = true,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = true,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "BufReadPre",
  },
}
