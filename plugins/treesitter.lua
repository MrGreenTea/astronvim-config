return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    auto_install = true,
    textobjects = {
      playground = {
        enable = true,
      },
      lsp_interop = {
        enable = true,
        floating_preview_opts = { border = "single" },
        peek_definition_code = {
          ["<leader>lp"] = { query = "@function.outer", desc = "Peek function definition" },
          ["<leader>lP"] = { query = "@class.outer", desc = "Peek class definition" },
        },
      },
    },
  },
}
