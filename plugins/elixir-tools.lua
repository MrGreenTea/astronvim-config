return {
  "elixir-tools/elixir-tools.nvim",
  enabled = false,
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    nextls = { enable = true },
    credo = { enable = true },
    -- use mason's eixirls
    elixirls = {
      enable = false,
    },
  },
  ft = { "heex", "elixir" },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
