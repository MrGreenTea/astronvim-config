return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  enabled = false,
  config = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
    require("lsp_lines").setup()
  end,
}