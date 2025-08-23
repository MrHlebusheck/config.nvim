local config_dir = require("additions.config_dir")
local cfg_path = ".nvim/node.json"

local function dap_debugger(port)
  return {
    vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
    port
  }
end

local default_adapter_cfg = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = dap_debugger("${port}")
  }
}

local default_cfg = {
  name = 'Launch',
  type = 'pwa-node',
  request = 'launch',
  program = '${file}',
  rootPath = '${workspaceFolder}',
  cwd = '${workspaceFolder}',
  sourceMaps = true,
  protocol = 'inspector',
  console = 'integratedTerminal',
}

return function(dap)
  dap.adapters["pwa-node"] = default_adapter_cfg
  dap.configurations.javascript = { default_cfg }

  if config_dir.available and config_dir.is_file(cfg_path) then
    local cfg = config_dir.read_json(cfg_path)
    local dbg = cfg.debugger
    if dbg then
      dap.adapters["node"] = function(cb, cfg)
        cb({
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = dap_debugger("${port}")
          }
        })
      end
      dap.configurations.javascript = {
        {
          name = 'Launch',
          type = 'pwa-node',
          request = 'launch',
          program = dbg.program or '${file}',
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        } }
    end
  end

  dap.configurations.typescript = dap.configurations.javascript
end
