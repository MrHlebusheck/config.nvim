return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
    require("ibl").setup({
      exclude = {
        filetypes = { "dashboard", "alpha", "starter", "neo-tree", "help", "lazy" },
        buftypes = { "terminal", "nofile" },
      },
      indent = {
        char = "│",
      },
      whitespace = {
        highlight = { "Whitespace" },
        remove_blankline_trail = false,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        highlight = { "Function", "Label" },
      },
    })

    vim.opt.list = true
    vim.opt.listchars:append("space:·")
    vim.opt.listchars:append("tab:→ ")
    vim.opt.listchars:append("trail:•")
  end,
}
