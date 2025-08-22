local config_dir = require("additions.config_dir")
local cfg_path = ".nvim/c.json"

local default_adapter_cfg = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

local default_cfg = {
  name = "Launch",
  type = "gdb",
  request = "launch",
  program = "a.out",
  cwd = "${workspaceFolder}",
  stopAtBeginningOfMainSubprogram = false,
}


return function(dap)
  dap.adapters.gdb = default_adapter_cfg

  dap.configurations.c = { default_cfg }

  if config_dir.available and config_dir.is_file(cfg_path) then
    local cfg = config_dir.read_json(cfg_path)
    local dbg = cfg.debugger
    if dbg then
      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = dbg.program,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
        {
          name = 'Attach to gdbserver',
          type = 'gdb',
          request = 'attach',
          target = dbg.target or "localhost:5678",
          cwd = '${workspaceFolder}'
        },
      }
    end
  end
  
  dap.configurations.cpp = dap.configurations.c
  dap.configurations.rust = dap.configurations.c
end
