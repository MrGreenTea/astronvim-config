return {
  "linux-cultist/venv-selector.nvim",
  dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
  opts = {
    poetry_path = "~/.cache/pypoetry/virtualenvs",
    name = { "venv", ".venv" },
    dap_enabled = "true",
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      desc = "Auto select virtualenv on Nvim open",
      pattern = "AstroFile",
      callback = function()
        local venv = vim.fn.findfile("pyproject.toml", vim.fn.getcwd() .. ";")
        if venv ~= "" then require("venv-selector").retrieve_from_cache() end
      end,
      once = true,
    })
  end,
  -- because of the autocmd this is kinda redundant
  -- but if there is no cached venv this is needed then
  cmd = { "VenvSelect", "VenvSelectCached", "VenvSelectCurrent" },
  ft = { "python" },
}
