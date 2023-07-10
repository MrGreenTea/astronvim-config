return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
  },
  -- ft = { "python", "typescript", "rust" },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-python",
        require "neotest-rust",
      },
    }
  end,
}
