return {
  "folke/flash.nvim",
  -- event = "VeryLazy",
  opts = {},
  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump {
          jump = {
            autojump = true,
          },
        }
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter {
          label = {
            rainbow = {
              enabled = true,
            },
          },
        }
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function() require("flash").remote() end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search {
          label = {
            rainbow = {
              enabled = true,
            },
          },
        }
      end,
      desc = "Treesitter Search",
    },
  },
}
