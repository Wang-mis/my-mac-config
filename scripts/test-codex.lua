-- nvim --headless -n -u NONE -i NONE -l scripts/test-codex.lua
package.path = vim.fn.getcwd() .. "/nvim/lua/?.lua;" .. package.path
local calls = {}
local root = "/tmp/project with spaces"
_G.LazyVim = {
	root = function()
		return root
	end,
}
_G.Snacks = {
	terminal = {
		toggle = function(cmd, opts)
			calls[#calls + 1] = { cmd = cmd, opts = opts }
			opts.win.on_buf({ buf = vim.api.nvim_get_current_buf() })
			return "terminal"
		end,
	},
}
local executable = vim.fn.executable
vim.fn.executable = function(cmd)
	return cmd == "codex" and 1 or 0
end
local codex = require("config.codex")
assert(codex.toggle() == "terminal")
assert(vim.deep_equal(calls[1].cmd, { "codex" }))
assert(calls[1].opts.cwd == root and calls[1].opts.win.position == "right")
assert(calls[1].opts.count == 1 and calls[1].opts.win.width == 0.45)
assert(vim.b.codex_root == root)
root = "/tmp/different project"
codex.toggle(true)
assert(vim.deep_equal(calls[2].cmd, { "codex", "resume" }))
assert(calls[2].opts.cwd == "/tmp/project with spaces", "terminal lost its project root")
vim.b.codex_root = nil
codex.toggle()
assert(calls[3].opts.cwd == root, "projects share the wrong directory")
local spec = dofile("nvim/lua/plugins/codex.lua")[1]
spec.init()
vim.cmd("Codex")
vim.cmd("CodexResume")
assert(#calls == 5)
local notified = false
local notify = vim.notify
vim.notify = function()
	notified = true
end
vim.fn.executable = function()
	return 0
end
codex.toggle()
assert(notified and #calls == 5, "missing CLI was not handled")
vim.fn.executable = executable
vim.notify = notify
print("PASS: Codex commands, arguments, project roots, layout and missing CLI")
vim.cmd("qa!")
