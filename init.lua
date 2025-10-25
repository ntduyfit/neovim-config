-- bootstrap lazy.nvim, LazyVim and your plugins
--
require("config.lazy")
if vim.g.neovide then
  vim.o.guifont = "Google Sans Mono Nerd:b,SF Mono:h14:b:#e-antialias"
  vim.opt.linespace = 12
  -- vim.g.autoformat = false
  vim.g.neovide_padding_top = 8
  vim.g.neovide_padding_bottom = 8
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_opacity = 1
  vim.g.neovide_normal_opacity = 0.0
  -- vim.g.neovide_scroll_animation_length = 0.1

  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 40
  vim.g.neovide_floating_blur_amount_y = 40
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 0
  vim.g.neovide_light_angle_degrees = 90
  vim.g.neovide_light_radius = 1000
  vim.g.neovide_floating_corner_radius = 0

  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_mode = { "torpedo", "sonicboom" }
  vim.g.neovide_confirm_quit = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.2
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_refresh_rate = 144

  vim.g.neovide_input_macos_option_is_meta = true

  vim.g.neovide_cursor_vfx_opacity = 60.0
  -- vim.g.neovide_cursor_hack = true

  vim.g.experimental_layer_grouping = false

  vim.g.neovide_show_border = true
  -- vim.g.neovide_profiler = true
  --
  -- Helper function for transparency formatting
  vim.g.transparency = 0.95
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  vim.g.neovide_background_color = "#24273a" .. alpha()

  vim.cmd.colorscheme("catppuccin")
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "#24273a", fg = "#b7bdf8" }) -- catppuccin
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "#222436", fg = "#c8d3f5" }) -- catppuccin
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", "<C-R>+") -- Paste insert mode
  vim.keymap.set(
    "n",
    "<D-=>",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
    { silent = true }
  )
  vim.keymap.set(
    "n",
    "<D-->",
    ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
    { silent = true }
  )
  vim.keymap.set("n", "<D-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
elseif not vim.g.vscode then

  -- vim.opt.tabstop = 2
  -- vim.opt.softtabstop = 2
  -- vim.opt.shiftwidth = 2
  -- vim.opt.expandtab = true
  -- vim.opt.autoindent = true
end
vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait800-blinkon600-blinkoff600",
  "i-ci:ver25-Cursor/lCursor-blinkwait8000-blinkon600-blinkoff600",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100",
}, ",")
vim.o.background = "dark"

-- vim.o.updatetime = 300
--vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, max_width=80})]])
vim.opt.smartindent = false
vim.g.lazyvim_prettier_needs_config = true
vim.o.laststatus = 0
-- vim.b.autoformat = false
vim.g.root_spec = { { ".git" }, "lsp", "cwd" }
-- vim.lsp.set_log_level("debug")
