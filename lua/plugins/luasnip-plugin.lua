-- sudo luarocks install jsregexp
return {
  "L3MON4D3/LuaSnip",
  dependencies = { "saadparwaiz1/cmp_luasnip" },
  lazy = true,
  event = "InsertEnter",
  version = "v2.*",
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")

    ls.setup()

    vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    require("snippets.python")()
    require("snippets.c")()
  end
}
