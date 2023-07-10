return {
  "Exafunction/codeium.vim",
  keys = {
    { "<M-p>", function() return vim.fn["codeium#Complete"]() end, { "i", "n" } },
  },
}
