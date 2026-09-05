-- Run from the repository root:
-- nvim --headless -u NONE -i NONE -l scripts/test-window-resize.lua
package.path = vim.fn.getcwd() .. "/nvim/lua/?.lua;" .. package.path
local resize = require("config.window_resize")
vim.o.columns = 160
vim.o.lines = 60
vim.o.equalalways = false
vim.o.splitright = true
vim.o.splitbelow = true

local checks = 0
local function check(ok, message)
	assert(ok, message)
	checks = checks + 1
end

local function boundary(win, axis)
	local pos = vim.api.nvim_win_get_position(win)
	return axis == "horizontal" and pos[2] + vim.api.nvim_win_get_width(win)
		or pos[1] + vim.api.nvim_win_get_height(win)
end

for _, layout in ipairs({ "vsplit", "split", "vsplit | vsplit", "vsplit | split", "split | vsplit" }) do
	vim.cmd("only!")
	vim.cmd(layout)
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		vim.api.nvim_set_current_win(win)
		for _, axis in ipairs({ "horizontal", "vertical" }) do
			local nr = vim.fn.winnr()
			local forward = axis == "horizontal" and "l" or "j"
			local backward = axis == "horizontal" and "h" or "k"
			local target = vim.fn.winnr(forward) ~= nr and nr or vim.fn.winnr(backward)
			if target ~= nr or vim.fn.winnr(forward) ~= nr then
				local id = vim.fn.win_getid(target)
				local before = boundary(id, axis)
				resize.move(axis, -2)
				check(boundary(id, axis) == before - 2, layout .. ": negative movement " .. axis)
				resize.move(axis, 2)
				check(boundary(id, axis) == before, layout .. ": positive movement " .. axis)
				check(vim.api.nvim_get_current_win() == win, "focus changed")
			end
		end
	end
end

vim.cmd("only!")
local before = vim.fn.winrestcmd()
local cmdheight = vim.o.cmdheight
for _, axis in ipairs({ "horizontal", "vertical" }) do
	resize.move(axis, -2)
	resize.move(axis, 2)
end
check(vim.fn.winrestcmd() == before and vim.o.cmdheight == cmdheight, "single window changed")

vim.cmd("vsplit") -- Current window is on the right.
local width = vim.api.nvim_win_get_width(0)
resize.move("horizontal", -2)
check(vim.api.nvim_win_get_width(0) == width + 2, "right window must grow when moving left")
resize.move("horizontal", -1000)
check(vim.api.nvim_win_get_width(vim.fn.win_getid(vim.fn.winnr("h"))) >= vim.o.winminwidth, "minimum width violated")

local float = vim.api.nvim_open_win(
	vim.api.nvim_create_buf(false, true),
	true,
	{ relative = "editor", row = 2, col = 2, width = 20, height = 5 }
)
before = vim.fn.winrestcmd()
resize.move("horizontal", -2)
resize.move("vertical", 2)
check(vim.fn.winrestcmd() == before and vim.api.nvim_win_get_width(float) == 20, "float changed")
vim.api.nvim_win_close(float, true)

-- A Snacks sidebar list is a floating child of a real split container.
vim.cmd("only!")
vim.cmd("vsplit")
vim.cmd("wincmd h")
local parent = vim.api.nvim_get_current_win()
local parent_buf = vim.api.nvim_create_buf(false, true)
vim.api.nvim_win_set_buf(parent, parent_buf)
vim.bo[parent_buf].filetype = "snacks_layout_box"
local child_buf = vim.api.nvim_create_buf(false, true)
vim.bo[child_buf].filetype = "snacks_picker_list"
local child =
	vim.api.nvim_open_win(child_buf, true, { relative = "win", win = parent, row = 0, col = 0, width = 20, height = 5 })
width = vim.api.nvim_win_get_width(parent)
resize.move("horizontal", 2)
check(vim.api.nvim_win_get_width(parent) == width + 2, "sidebar parent did not grow")
resize.move("horizontal", -2)
check(vim.api.nvim_win_get_width(parent) == width, "sidebar parent did not shrink")
check(vim.api.nvim_get_current_win() == child, "sidebar list lost focus")
vim.api.nvim_win_close(child, true)
print("PASS: " .. checks .. " separator movement checks")
vim.cmd("qa!")
