local M = {}

-- Move a split boundary, not a fixed amount of the current window's size.
local function move_split(axis, offset)
  local current = vim.fn.winnr()
  local forward = axis == "horizontal" and "l" or "j"
  local backward = axis == "horizontal" and "h" or "k"
  local target = current
  if vim.fn.winnr(forward) == current then
    target = vim.fn.winnr(backward)
    if target == current then
      return -- No split boundary on this axis; leave the command area alone.
    end
  end

  if axis == "horizontal" then
    vim.fn.win_move_separator(target, offset)
  else
    vim.fn.win_move_statusline(target, offset)
  end
end

function M.move(axis, offset)
  local win = vim.api.nvim_get_current_win()
  local config = vim.api.nvim_win_get_config(win)
  if config.relative ~= "" then
    -- Snacks sidebars overlay their list/input on a real split container.
    local parent = config.relative == "win" and config.win or nil
    if not parent or not vim.api.nvim_win_is_valid(parent) then
      return
    end
    local ft = vim.bo[vim.api.nvim_win_get_buf(win)].filetype
    local parent_ft = vim.bo[vim.api.nvim_win_get_buf(parent)].filetype
    if
      not ft:match("^snacks_picker_")
      or parent_ft ~= "snacks_layout_box"
      or vim.api.nvim_win_get_config(parent).relative ~= ""
    then
      return
    end
    win = parent
  end
  vim.api.nvim_win_call(win, function()
    move_split(axis, offset)
  end)
end

return M
