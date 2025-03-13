return {
  "folke/noice.nvim",
  event = "VeryLazy",
  lazy = true,
  opts = {
    lsp = { progress = { enabled = false } }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup {
          render = "minimal",
          timeout = 250
        }
        vim.notify = require('notify')
      end
    }
  }
}
