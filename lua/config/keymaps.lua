-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

-- map({ "i", "s" }, "<Tab>", function()
--   local copilot = require("copilot.suggestion")
--   local luasnip = require("luasnip")
--   local cmp = require("blink-cmp")
--   if copilot.is_visible() then
--     copilot.accept_line()
--   elseif cmp.is_visible() then
--     -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
--     cmp.select_next()
--     -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--     -- this way you will only jump inside the snippet region
--   elseif luasnip.expand_or_jumpable() then
--     luasnip.expand_or_jump()
--   end
-- end)

map({ "n", "v", "i" }, "<D-z>", "<cmd>u<CR>", { desc = "Undo" })
map({ "n", "v" }, "<S-D-z>", "<cmd>red<CR>", { desc = "Undo" })
map("i", "<D-Z>", "<cmd>red<CR>", { desc = "Undo" })

map({ "n", "v" }, "[[", "<C-o>", { desc = "Jump to previous" })
map({ "n", "v" }, "]]", "<C-i>", { desc = "Jump to next" })

-- map({ "n", "v", "i" }, "<C-`>", "<cmd>ToggleTerm<CR>", { desc = "Terminal" })

map("n", "<A-Down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-Up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-Down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

map({ "i", "x", "n", "s" }, "<D-s>", "<cmd>wa<cr><esc>", { desc = "Save file" })
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>wa<cr><esc>", { desc = "Save file" })
map({ "i", "x", "n", "s" }, "<D-2>", "<cmd>Neotree focus git_status<CR>", { desc = "git" })

-- map({ "n", "v", "i" }, "<leader>", vim.lsp.buf.rename, { desc = "rename" })
-- map({ "n", "v", "i" }, "<A-CR>", vim.lsp.buf.code_action, { desc = "Code Action" })
-- map({ "n", "v", "i" }, "<D-/>", "gcc", { desc = "Comment code" })
vim.keymap.del("n", "<leader>l")
