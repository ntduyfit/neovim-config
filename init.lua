-- bootstrap lazy.nvim, LazyVim and your plugins
--
require("config.lazy")
if vim.g.neovide then
  vim.o.guifont = "SF Mono Ligatures:h14:b"
  vim.opt.linespace = 12
  -- vim.g.autoformat = false
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_opacity = 0.9999
  vim.g.neovide_normal_opacity = 0.92
  -- vim.g.neovide_scroll_animation_length = 0.1

  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 0
  vim.g.neovide_floating_blur_amount_y = 0
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 10
  vim.g.neovide_light_radius = 1
  vim.g.neovide_floating_corner_radius = 0.25

  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = { "", "" }
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_animation_length = 0.15
  vim.g.neovide_cursor_trail_size = 0.0
  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_refresh_rate = 144

  vim.g.neovide_input_macos_option_is_meta = true

  vim.g.neovide_cursor_vfx_opacity = 80.0
  vim.g.neovide_cursor_hack = true

  vim.g.experimental_layer_grouping = true

  vim.g.neovide_show_border = false
  -- vim.g.neovide_profiler = true

  vim.cmd.colorscheme("catppuccin")
  vim.api.nvim_set_hl(0, "Normal", { bg = "#24273a", fg = "#b7bdf8" })
elseif not vim.g.vscode then
  vim.cmd.colorscheme("catppuccin")
  vim.o.guicursor = table.concat({
    "n-v-c:block-Cursor/lCursor-blinkwait800-blinkon600-blinkoff600",
    "i-ci:ver25-Cursor/lCursor-blinkwait8000-blinkon600-blinkoff600",
    "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
  }, ",")

  -- vim.opt.tabstop = 2
  -- vim.opt.softtabstop = 2
  -- vim.opt.shiftwidth = 2
  -- vim.opt.expandtab = true
  -- vim.opt.autoindent = true
end

vim.o.background = "dark"

-- vim.o.updatetime = 300
--vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, max_width=80})]])
vim.opt.smartindent = false
-- vim.g.lazyvim_prettier_needs_config = true
vim.o.laststatus = 0
-- vim.b.autoformat = false
vim.g.root_spec = { { ".git" }, "lsp", "cwd" }
