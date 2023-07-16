return {
  lsp = {
    servers = {
      "pylsp",
    },
    config = {
      tailwindcss = {
        on_attach = function(_client, bufnr)
          -- other stuff --
          require("tailwindcss-colors").buf_attach(bufnr)
        end,
      },
      pylsp = {
        settings = {
          pylsp = {
            configurationSources = { "flake8" },
            plugins = {
              flake8 = { enabled = true },
              pycodestyle = { enabled = false },
              mccabe = { enabled = false },
              pyflakes = { enabled = false },
              rope_autoimport = {
                enabled = false,
              },
            },
          },
        },
      },
    },
  },
}
