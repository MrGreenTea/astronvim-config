-- stylua: ignore
local running_animated = { "⠄", "⠆", "⠇", "⠃", "⠁", "⠁", "⠁", "⠉", "⠉", "⠈", "⠈", "⠈", "⠘",
  "⠸", "⠰", "⠠", "⠠", "⠠", "⠤", "⠤", "⠄", "⠄" }

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
    "marilari88/neotest-vitest",
    "thenbe/neotest-playwright",
    {
      "folke/neodev.nvim",
      opts = function(_, opts)
        opts.library = opts.library or {}
        if opts.library.plugins ~= true then
          opts.library.plugins = require("astronvim.utils").list_insert_unique(opts.library.plugins, "neotest")
        end
        opts.library.types = true
      end,
    },
  },
  cmd = { "Neotest", "NeotestPlaywrightProject", "NeotestPlaywrightPreset", "NeotestPlaywrightRefresh" },
  opts = function()
    return {
      adapters = {
        require "neotest-rust",
        require "neotest-python",
        require "neotest-vitest",
        require("neotest-playwright").adapter {
          options = {
            persist_project_selection = true,
            enable_dynamic_test_discovery = true,
          },
        },
      },
      icons = {
        running_animated = running_animated,
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
      "<leader>TA",
      function() require("neotest").run.run { suite = true } end,
      desc = "Run all tests",
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
          suite = false,
          strategy = "dap",
        }
      end,
    },
    {
      desc = "Open neotest summary",
      "<leader>TS",
      function() require("neotest").summary.toggle() end,
    },
    {
      desc = "Playwright attach",
      "<leader>Tp",
      function() require("neotest").playwright.attachment() end,
    },
  },
  config = function(_, opts)
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace "neotest"
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    -- use overseer for neotest
    if not opts.consumers then opts.consumers = {} end

    -- opts.consumers.overseer = require "neotest.consumers.overseer"
    opts.consumers.playwright = require("neotest-playwright.consumers").consumers

    require("neotest").setup(opts)
  end,
}
