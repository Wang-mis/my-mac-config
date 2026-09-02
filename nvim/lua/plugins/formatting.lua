local biome_roots = { "biome.json", "biome.jsonc" }
local biome_filetypes = {
  astro = true,
  css = true,
  graphql = true,
  javascript = true,
  javascriptreact = true,
  json = true,
  jsonc = true,
  scss = true,
  svelte = true,
  typescript = true,
  typescriptreact = true,
  vue = true,
}

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters = opts.formatters or {}
      opts.formatters.prettier = vim.tbl_deep_extend("force", opts.formatters.prettier or {}, {
        condition = function(_, ctx)
          local filetype = vim.bo[ctx.buf].filetype
          return not (biome_filetypes[filetype] and vim.fs.root(ctx.dirname, biome_roots) ~= nil)
        end,
      })
    end,
  },
}
