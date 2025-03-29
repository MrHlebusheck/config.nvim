return {
  "folke/noice.nvim",
  event = "VeryLazy",
  lazy = true,
  opts = {
    lsp = { progress = { enabled = false } }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
