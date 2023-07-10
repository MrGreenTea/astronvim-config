return {
  "elixir-tools/elixir-tools.nvim",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function() require("elixir").setup { elixirls = { enable = false } } end,
  enabled = false,
  ft = { "heex", "elixir" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
