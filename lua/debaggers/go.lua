-- dlv dap --listen=0.0.0.0:5678 --log --log-output=dap

local config_dir = require("additions.config_dir")
local cfg_path = ".nvim/go.json"

local default_adapter_cfg = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
  }
}

local default_cfg = {
  type = "delve",
  name = "Debug",
  request = "launch",
  program = "${file}"
}

return function(dap)
  dap.adapters.delve = default_adapter_cfg
  dap.configurations.go = { default_cfg }

  if config_dir.available and config_dir.is_file(cfg_path) then
    local cfg = config_dir.read_json(cfg_path)
    local dbg = cfg.debugger
    if dbg then
      dap.adapters.delve_remote = function(cb, cfg)
        cb({
          type = 'server',
          port = cfg.port,
          host = cfg.host
        })
      end

      dap.configurations.go = {
        {
          type = "delve",
          name = "Debug",
          request = "launch",
          program = dbg.program or "${file}"
        },
        {
          type = "delve_remote",
          name = "Debug remote",
          request = "launch",
          port = dbg.port or "5678",
          host = dbg.host or "127.0.0.1",
          program = dbg.program or "${file}",
        }
      }
    end
  end
end
