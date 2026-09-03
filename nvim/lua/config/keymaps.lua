-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- VS Code-style aliases. LazyVim's native leader mappings remain available.
map("n", "<D-p>", "<leader><space>", { remap = true, desc = "Find Files" })
map("n", "<D-S-p>", "<leader>sC", { remap = true, desc = "Command Palette" })
map("n", "<D-S-f>", "<leader>sg", { remap = true, desc = "Search in Files" })
map("n", "<D-b>", "<leader>e", { remap = true, desc = "Toggle Explorer" })
map({ "n", "i", "x", "s" }, "<D-s>", "<cmd>write<cr>", { desc = "Save File" })
map("n", "<D-/>", "gcc", { remap = true, desc = "Toggle Comment" })
map("x", "<D-/>", "gc", { remap = true, desc = "Toggle Comment" })
map({ "n", "x" }, "<D-.>", "<leader>ca", { remap = true, desc = "Code Action" })
map("n", "<F2>", "<leader>cr", { remap = true, desc = "Rename Symbol" })
map("n", "<F12>", "gd", { remap = true, desc = "Go to Definition" })
map("n", "<S-F12>", "gr", { remap = true, desc = "Find References" })
map("n", "<D-S-o>", "<leader>ss", { remap = true, desc = "Document Symbols" })
map("n", "<M-z>", "<leader>uw", { remap = true, desc = "Toggle Word Wrap" })

map("n", "<M-S-Down>", "<cmd>copy .<cr>", { desc = "Duplicate Line Down" })
map("n", "<M-S-Up>", "<cmd>copy .-1<cr>", { desc = "Duplicate Line Up" })
map("x", "<M-S-Down>", ":copy '><cr>gv", { desc = "Duplicate Selection Down" })
map("x", "<M-S-Up>", ":copy '<-1<cr>gv", { desc = "Duplicate Selection Up" })
