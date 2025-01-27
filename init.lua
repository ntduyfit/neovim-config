-- bootstrap lazy.nvim, LazyVim and your plugins
--
require("config.lazy")
if vim.g.neovide then
  vim.o.guifont = "Liga SFMono Nerd Font:h13:b"
  vim.opt.linespace = 8
  -- vim.g.autoformat = false
  vim.g.neovide_padding_top = 8
  vim.g.neovide_padding_bottom = 8
  vim.g.neovide_padding_right = 12
  vim.g.neovide_padding_left = 12
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.96
  -- vim.g.neovide_scroll_animation_length = 0.1

  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 8.0
  vim.g.neovide_floating_blur_amount_y = 8.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 8

  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_vfx_mode = "pixeldust"
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.2
  vim.g.neovide_cursor_animate_in_insert_mode = false
  -- vim.g.neovide_refresh_rate = 60

  vim.g.neovide_input_macos_option_is_meta = true

  vim.g.neovide_cursor_vfx_opacity = 80.0

  vim.g.experimental_layer_grouping = true
  -- vim.g.neovide_profiler = true

  vim.cmd.colorscheme("everforest")
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
-- vim.b.autoformat = true
