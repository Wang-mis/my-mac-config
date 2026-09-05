-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Leave Ctrl+arrows to macOS Mission Control; use Ctrl+Cmd for resizing.
for _, key in ipairs({ "<C-Up>", "<C-Down>", "<C-Left>", "<C-Right>" }) do
  pcall(vim.keymap.del, "n", key)
end
local resize = require("config.window_resize")
map("n", "<C-D-h>", function()
  resize.move("horizontal", -2)
end, { desc = "Move Separator Left" })
map("n", "<C-D-l>", function()
  resize.move("horizontal", 2)
end, { desc = "Move Separator Right" })
map("n", "<C-D-j>", function()
  resize.move("vertical", 2)
end, { desc = "Move Separator Down" })
map("n", "<C-D-k>", function()
  resize.move("vertical", -2)
end, { desc = "Move Separator Up" })

-- VS Code-style aliases. LazyVim's native leader mappings remain available.
map("n", "<D-p>", "<leader><space>", { remap = true, desc = "Find Files" })
map("n", "<D-S-p>", "<leader>sC", { remap = true, desc = "Command Palette" })
map("n", "<D-S-f>", "<leader>sg", { remap = true, desc = "Search in Files" })
map("n", "<D-b>", "<leader>e", { remap = true, desc = "Toggle Explorer" })
map({ "n", "i", "x", "s" }, "<D-s>", "<cmd>write<cr>", { desc = "Save File" })
map("n", "<D-z>", "u", { desc = "Undo" })
map("n", "<D-S-z>", "<C-r>", { desc = "Redo" })
map("i", "<D-z>", "<C-g>u<C-o>u", { desc = "Undo" })
map("i", "<D-S-z>", "<C-g>u<C-o><C-r>", { desc = "Redo" })
map({ "x", "s" }, "<D-z>", "<Esc>u", { desc = "Undo" })
map({ "x", "s" }, "<D-S-z>", "<Esc><C-r>", { desc = "Redo" })
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

-- VS Code-style insert-mode cursor and line actions. Ghostty sends the
-- corresponding modified keys with the Kitty keyboard protocol.
map("i", "<S-CR>", "<Esc>o", { desc = "Insert Line Below" })
map("i", "<D-S-CR>", "<Esc>O", { desc = "Insert Line Above" })
map("i", "<D-h>", "<Home>", { desc = "Go to Line Start" })
map("i", "<D-l>", "<End>", { desc = "Go to Line End" })

-- Keep the selected lines active so repeated indentation stays convenient.
map("x", "<Tab>", ">gv", { desc = "Indent Selection" })
map("x", "<S-Tab>", "<gv", { desc = "Outdent Selection" })
