return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- Programming languages
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.lua" },

  -- Completions
  -- { import = "astrocommunity.completion.codeium-vim" },

  -- Motion
  -- { import = "astrocommunity.motion.mini-surround" },

  -- Test
}
