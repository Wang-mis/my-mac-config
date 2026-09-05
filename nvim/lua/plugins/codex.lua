return {
  {
    "folke/snacks.nvim",
    init = function()
      vim.api.nvim_create_user_command("Codex", function()
        require("config.codex").toggle()
      end, { desc = "Toggle Codex terminal for this project" })
      vim.api.nvim_create_user_command("CodexResume", function()
        require("config.codex").toggle(true)
      end, { desc = "Toggle Codex session picker for this project" })
    end,
    keys = {
      { "<leader>ac", "<cmd>Codex<cr>", desc = "Codex Terminal" },
      { "<leader>ar", "<cmd>CodexResume<cr>", desc = "Codex Resume" },
    },
  },
}
