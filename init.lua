return {
  lsp = {
    -- customize lsp formatting options
    servers = {
      "pylsp",
    },
    config = {
      pyright = {
        plugins = {
          rope_autoimport = {
            enabled = true,
          },
        },
      },
    },
  },
}
