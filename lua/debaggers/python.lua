local config_dir = require("additions.config_dir")
local cfg_path = ".nvim/python.json"

local default_adapter_cfg = {
  type = "executable",
  command = ".venv/bin/python",
  args = { "-m", "debugpy.adapter" },
  options = { source_filetype = "python" },
  host = "127.0.0.1",
  port = "5678"
}

local default_cfg = {
  type = 'python',
  request = 'launch',
  name = "Launch file",
  program = "${file}",
  console = "internalConsole",
  pythonPath = function()
    local cwd = vim.fn.getcwd()
    if vim.fn.executable(cwd .. '/.venv/bin/python') then
      return cwd .. '/.venv/bin/python'
    else
      return '/usr/bin/python'
    end
  end,
}


return function(dap)
  if config_dir.available and config_dir.is_file(cfg_path) then
    local cfg = config_dir.read_json(cfg_path)
    local dbg = cfg.debugger
    if dbg then
      dap.adapters.python = function(cb, cfg)
        if cfg.request == 'attach' then
          cb({
            type = "server",
            port = cfg.connect.port,
            host = cfg.connect.host,
            options = dbg.options or default_adapter_cfg.options,
          })
        else
          cb({
            type = "executable",
            command = cfg.pythonPath,
            args = dbg.args or default_adapter_cfg.args,
            options = dbg.options or default_adapter_cfg.options,
          })
        end
      end

      dap.configurations.python = {
        {
          type = default_cfg.type,
          request = "launch",
          name = "Launch file",
          program = dbg.program or default_cfg.program,
          pythonPath = dbg.pythonPath or default_cfg.pythonPath,
        },
        {
          type = default_cfg.type,
          request = "attach",
          name = "Connect to the remote debugger",
          program = dbg.program or default_cfg.program,
          pythonPath = dbg.pythonPath or default_cfg.pythonPath,
          connect = {
            host = dbg.host or default_adapter_cfg.host,
            port = dbg.port or default_adapter_cfg.port,
          },
          pathMappings = {
            {
              localRoot = "${workspaceFolder}",
              remoteRoot = ".",
            },
          },
        } }
      return nil
    end
  end

  dap.adapters.python = function(cb)
    cb(default_adapter_cfg)
  end

  dap.configurations.python = { default_cfg }
end
