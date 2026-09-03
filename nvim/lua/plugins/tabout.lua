local function skip_trailing_punctuation()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()
  local next_char = line:sub(cursor[2] + 1, cursor[2] + 1)

  if next_char:match("[:=.;]") then
    return vim.api.nvim_replace_termcodes("<Right>", true, false, true)
  end

  return false
end

return {
  {
    "abecodes/tabout.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
      act_as_tab = true,
      act_as_shift_tab = true,
      enable_backwards = true,
      completion = false,
      ignore_beginning = true,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "<", close = ">" },
      },
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = function(_, opts)
      opts.keymap = opts.keymap or {}
      opts.keymap["<Tab>"] = {
        LazyVim.cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }),
        skip_trailing_punctuation,
        "fallback_to_mappings",
      }
      opts.keymap["<S-Tab>"] = {
        "snippet_backward",
        "fallback_to_mappings",
      }
    end,
  },
}
