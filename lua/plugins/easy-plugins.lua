return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
  {
    'simrat39/symbols-outline.nvim',
    event = "VeryLazy",
    config = true
  },
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    config = true
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
    event = "VeryLazy",
    lazy = true
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
    event = "BufEnter",
    lazy = true
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = "0.1.5",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    cmd = "Telescope",
    lazy = true
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    lazy = true,
    cmd = "ToggleTerm"
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    event = "BufEnter",
    lazy = true
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = { "kevinhwang91/promise-async" },
    opts = {},
    event = "BufEnter",
    lazy = true
  },
  {
    'sindrets/diffview.nvim',
    opts = {},
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewRefresh" }
  },
  {
    "max397574/better-escape.nvim",
    opts = {},
    event = "InsertEnter",
    lazy = true
  },
  { 'rafcamlet/nvim-luapad', dependencies = "antoinemadec/FixCursorHold.nvim" }
}
