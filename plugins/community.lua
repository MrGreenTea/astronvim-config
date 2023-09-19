return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- Programming languages
  -- TODO: include them directly and just what I need
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.lua" },
}
