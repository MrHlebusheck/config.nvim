return {
  "folke/noice.nvim",
  event = "VeryLazy",
  lazy = true,
  opts = {
    lsp = { progress = { enabled = false } },
    cmdline = {view = "cmdline"}
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  }
}
