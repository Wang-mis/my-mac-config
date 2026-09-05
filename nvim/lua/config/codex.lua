local M = {}

function M.toggle(resume)
  if vim.fn.executable("codex") ~= 1 then
    vim.notify("Codex CLI not found in PATH. Install Codex and run `codex login` first.", vim.log.levels.ERROR)
    return
  end

  local cwd = vim.b.codex_root or LazyVim.root()
  local cmd = resume and { "codex", "resume" } or { "codex" }
  return Snacks.terminal.toggle(cmd, {
    cwd = cwd,
    count = 1,
    win = {
      position = "right",
      width = 0.45,
      bo = { filetype = "codex_terminal" },
      on_buf = function(term)
        vim.b[term.buf].codex_root = cwd
      end,
    },
  })
end

return M
