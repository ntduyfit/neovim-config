-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
if vim.g.neovide or vim.g.goneovim or not vim.g.vscode then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.opt.linespace = 8
  vim.g.neovide_padding_top = 12
  vim.g.neovide_padding_bottom = 12
  vim.g.neovide_padding_right = 12
  vim.g.neovide_padding_left = 12
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.92

  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 50.0
  vim.g.neovide_floating_blur_amount_y = 50.0

  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_confirm_quit = true

  vim.g.neovide_cursor_vfx_opacity = 80.0
  vim.g.neovide_cursor_vfx_particle_phase = 2

  vim.cmd.colorscheme("catppuccin") -- set to mocha flavour
  vim.api.nvim_set_hl(0, "Normal", { bg = "#303446", fg = "#c6d0f5" })
end
