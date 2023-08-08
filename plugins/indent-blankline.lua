return {
  "lukas-reineke/indent-blankline.nvim",
  event = "User AstroFile",
  config = function()
    require("indent_blankline").setup {
      buftype_exclude = { "terminal", "prompt", "nofile" },
      filetype_exclude = {
        "help",
        "dashboard",
        "Trouble",
        "dap.*",
        "NvimTree",
        "packer",
      },
      show_current_context = true,
      show_current_context_start = true,
      show_trailing_blankline_indent = false,
    }
  end,
}
