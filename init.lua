return {
  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
        ignore_filetypes = { "toml" },
      },
    },
    servers = {
      -- "pylsp",
    },
    config = {
      tailwindcss = {
        on_attach = function(_client, bufnr)
          -- other stuff --
          require("tailwindcss-colors").buf_attach(bufnr)
        end,
      },
      ruff_lsp = {
        init_options = {
          settings = {
            args = { "--ignore=E501" }, -- we just let black handle it
          },
        },
        on_attach = function(client, _bufnr)
          -- use pyright for hover
          client.server_capabilities.hoverProvider = false
        end,
      },
      pylsp = {
        settings = {
          pylsp = {
            configurationSources = { "flake8" },
            plugins = {
              mypy = { enabled = true, report_progress = true, exclude = { "tests", "test_.+\\.py$" } },
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
