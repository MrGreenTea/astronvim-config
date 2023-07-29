return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
  },
  ft = { "python", "typescript", "rust" },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-python",
        require "neotest-rust",
      },
    }
  end,
  keys = {
    {
      "<leader>Tt",
      function() require("neotest").run.run() end,
      desc = "Run nearest test",
    },
    {
      "<leader>Tf",
      function() require("neotest").run.run(vim.fn.expand "%") end,
      desc = "Run current file",
    },
    {
      "<leader>Ts",
      function() require("neotest").run.stop() end,
      desc = "Stop running tests",
    },
    {
      "<leader>Ta",
      function() require("neotest").run.attach() end,
      desc = "Attach to running test",
    },
    {
      desc = "Debug current test",
      "<leader>Td",
      function()
        require("neotest").run.run {
          strategy = "dap",
        }
      end,
    },
  },
}
