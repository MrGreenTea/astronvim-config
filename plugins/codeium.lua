local toggle_keys = "<leader>uA"

local function toggle_codeium()
  if vim.g.codeium_enabled == true then
    vim.keymap.set("n", toggle_keys, toggle_codeium, { noremap = true, desc = "Enable Codeium" })
    vim.cmd "CodeiumDisable"
  else
    vim.keymap.set("n", toggle_keys, toggle_codeium, { noremap = true, desc = "Disable Codeium" })
    vim.cmd "CodeiumEnable"
  end
end

return {
  "Exafunction/codeium.vim",
  event = "User AstroFile",
  keys = {
    {
      toggle_keys,
      toggle_codeium,
      desc = "Toggle Codeium",
    },
  },
  config = function()
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set(
      "i",
      "<C-g>",
      function() return vim.fn["codeium#Accept"]() end,
      { expr = true, desc = "Accept Codeium" }
    )
    vim.keymap.set(
      "i",
      "<c-;>",
      function() return vim.fn["codeium#CycleCompletions"](1) end,
      { expr = true, desc = "Next Codeium completion" }
    )
    vim.keymap.set(
      "i",
      "<c-,>",
      function() return vim.fn["codeium#CycleCompletions"](-1) end,
      { expr = true, desc = "Previous Codeium completion" }
    )
    vim.keymap.set(
      "i",
      "<c-x>",
      function() return vim.fn["codeium#Clear"]() end,
      { expr = true, desc = "Clear Codeium" }
    )
  end,
}
