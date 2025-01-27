-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map({ "n", "v", "i" }, "<D-z>", "<cmd>u<CR>", { desc = "Undo" })
map({ "n", "v" }, "<S-D-z>", "<cmd>red<CR>", { desc = "Undo" })
map("i", "<D-Z>", "<cmd>red<CR>", { desc = "Undo" })

map({ "n", "v" }, "[[", "<C-o>", { desc = "Jump to previous" })
map({ "n", "v" }, "]]", "<C-i>", { desc = "Jump to next" })

map({ "n", "v", "i" }, "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "Terminal" })
map({ "n" }, "<leader>kw", function()
  local buf = require("bufferline")
  buf.close_others()
end, { desc = "Close buffer" })

map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "i", "x", "n", "s" }, "<D-2>", "<cmd>Neotree focus git_status<CR>", { desc = "git" })

local toggleTree = function()
  local neotree = require("neo-tree.utils")
  local action = require("neo-tree.command")
  local path = vim.fn.getcwd()

  if neotree.is_hidden(path) then
    action.execute({ toggle = true, dir = vim.loop.cwd() })
  else
    action.execute({ toggle = false })
  end
end

map({ "x", "n", "s" }, "<D-1>", toggleTree, { desc = "File explorer" })
map({ "x", "n", "s" }, "<leader>o", toggleTree, { desc = "File explorer" })

map({ "n", "v", "i" }, "<D-p>", LazyVim.pick("files", { cwd = vim.fn.getcwd() }), { desc = "Find Files (root dir)" })
map({ "n", "v" }, "<leader>ff", LazyVim.pick("files", { cwd = vim.fn.getcwd() }), { desc = "Find Files (root dir)" })
map(
  { "n", "v" },
  "<leader><space>",
  LazyVim.pick("files", { cwd = vim.fn.getcwd() }),
  { desc = "Find Files (root dir)" }
)

-- map({ "n", "v", "i" }, "<leader>", vim.lsp.buf.rename, { desc = "rename" })
map({ "n", "v", "i" }, "<A-CR>", vim.lsp.buf.code_action, { desc = "Code Action" })
map({ "n", "v", "i" }, "<D-/>", "gcc", { desc = "Comment code" })

-- map({ "n", "v", "i" }, "<D-ø>", "<cmd>TypescriptOrganizeImports<CR>", { desc = "Optimize import" })
