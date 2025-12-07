return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mrcjkb/rustaceanvim"
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require('rustaceanvim.neotest')
      }
    }
  end
}
