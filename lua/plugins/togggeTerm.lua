function toggleterm_run_code()
  local ft = vim.bo.filetype
  local cmd = nil

  if ft == "rust" then
    cmd = "cargo run"
  else
    return
  end

  local Terminal = require("toggleterm.terminal").Terminal
  local term = Terminal:new({
    cmd = cmd,
    close_on_exit = false,
    direction = "vertical",
  })

  term:toggle()
end

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  lazy = true,
  cmd = "ToggleTerm",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 20
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    })
  end
}
