return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('lualine').setup {
      options = {
        theme = "moonfly",
        component_separators = { left = ' ', right = ' ' },
        section_separators = { left = ' ', right = '' },
      },
      sections = {
        lualine_x = {
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = { fg = "#ff9e64" },
          },
          'encoding',
          'fileformat',
          'filetype'
        },
      }
    }
  end,
  lazy = true,
  event = "BufEnter"
}
