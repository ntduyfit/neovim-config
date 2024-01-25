-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.o.guifont = "JetBrainsMono Nerd Font:h14:b"
vim.opt.linespace = 14
vim.g.neovide_padding_top = 24
vim.g.neovide_padding_bottom = 24
vim.g.neovide_padding_right = 24
vim.g.neovide_padding_left = 24
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0
vim.g.transparency = 0.98
vim.g.neovide_background_color = "#0f1117" .. alpha()

vim.g.neovide_window_blurred = true
vim.g.neovide_floating_blur_amount_x = 80.0
vim.g.neovide_floating_blur_amount_y = 80.0
vim.g.neovide_refresh_rate = 120
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
