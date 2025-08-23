return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  lazy = true,
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require('dap')
    local dapui = require("dapui")

    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    require("debaggers.gdb")(dap)
    require("debaggers.python")(dap)
    require("debaggers.node")(dap)
    require("debaggers.go")(dap)
  end,
}
