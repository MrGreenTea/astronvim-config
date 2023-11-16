-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  n = {
    ["<leader>T"] = {
      name = "󰙨 Neotest",
    },
    ["<leader>r"] = {
      name = " Overseer",
    },
    ["<leader>fo"] = {
      function() require("telescope").extensions.frecency.frecency { workspace = "CWD" } end,
      desc = "Find recent files",
    },
    ["<leader>fO"] = {
      function() require("telescope").extensions.frecency.frecency() end,
      desc = "Find all recent files",
    },
  },
}
