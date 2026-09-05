return {
  {
    "akinsho/bufferline.nvim",
    init = function()
      local function update()
        local has_file = false
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted and vim.bo[buf].buftype == "" then
            if vim.api.nvim_buf_get_name(buf) ~= "" or vim.bo[buf].modified then
              has_file = true
              break
            end
          end
        end
        vim.o.showtabline = has_file and 2 or 0
      end

      local group = vim.api.nvim_create_augroup("user_bufferline_visibility", { clear = true })
      -- Buffer deletion/listed changes must settle before counting buffers.
      local refresh = vim.schedule_wrap(update)
      vim.api.nvim_create_autocmd({
        "VimEnter",
        "BufAdd",
        "BufEnter",
        "BufDelete",
        "BufWipeout",
        "BufFilePost",
        "BufModifiedSet",
      }, { group = group, callback = refresh })
      vim.api.nvim_create_autocmd("OptionSet", {
        group = group,
        pattern = { "buflisted", "buftype" },
        callback = refresh,
      })
      update()
    end,
    opts = {
      options = {
        always_show_bufferline = true,
        auto_toggle_bufferline = false,
      },
    },
  },
}
