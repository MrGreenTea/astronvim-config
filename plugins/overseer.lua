return {
  "stevearc/overseer.nvim",
  config = true,
  cmd = { "OverseerRun", "OverseerToggle", "OverseerOpen" },
  opts = {},
  keys = {
    {
      "<leader>rr",
      function() require("overseer").run_template() end,
      desc = "Run",
    },
    {
      "<leader>rt",
      function() require("overseer").toggle() end,
      desc = "Toggle",
    },
  },
}
