-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local Util = require("lazyvim.util")

map({ "n", "v", "i" }, "<D-z>", "<cmd>u<CR>", { desc = "Undo" })
map({ "n", "v", "i" }, "<S-D-z>", "<cmd>red<CR>", { desc = "Undo" })
map({ "n", "v", "i" }, "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "Terminal" })
map({ "n", "v", "i" }, "<D-w>", "<cmd>bd<CR>", { desc = "Close buffer" })

map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "x", "n", "s" }, "<D-1>", function()
  local neotree = require("neo-tree.utils")
  local action = require("neo-tree.command")
  local path = vim.fn.getcwd()

  if neotree.is_hidden(path) then
    action.execute({ toggle = true, dir = vim.loop.cwd() })
  else
    action.execute({ toggle = false })
  end
end, { desc = "File explorer" })

map({ "n", "v", "i" }, "<D-p>", Util.telescope("files", { cwd = false }), { desc = "Find Files (root dir)" })

map({ "n", "v", "i" }, "<C-6>", vim.lsp.buf.rename, { desc = "rename" })
map({ "n", "v", "i" }, "<A-CR>", vim.lsp.buf.code_action, { desc = "Code Action" })
