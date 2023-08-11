return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  enabled = true,
  event = "User AstroFile",
  config = function()
    vim.diagnostic.config {
      virtual_text = false,
    }
    require("lsp_lines").setup()
  end,
}
