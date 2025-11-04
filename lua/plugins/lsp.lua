function in_array(array, value)
  for _, v in ipairs(array) do
    if v == value then
      return true
    end
  end
  return false
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason").setup()
    local mason_lspconfig = require("mason-lspconfig")

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }

    servers = mason_lspconfig.get_installed_servers()

    if not in_array(servers, "clangd") then
      if vim.fn.executable("clangd") == 1 then
        servers[#servers + 1] = "clangd"
      end
    end
    if not in_array(servers, "lua_ls") then
      if vim.fn.executable("lua-language-server") == 1 then
        servers[#servers + 1] = "lua_ls"
      end
    end
    if not in_array(servers, "rust_analyzer") then
      if vim.fn.executable("rust-analyzer") == 1 then
        servers[#servers + 1] = "rust_analyzer"
      end
    end

    for _, server in ipairs(servers) do
      local opts = {
        capabilities = capabilities
      }

      if server == "lua_ls" then
        opts = {
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          }
        }
      end

      if server == "pylsp" then
        opts = {
          capabilities = capabilities,
          settings = {
            pylsp = {
              plugins = {
                isort = { enabled = true },
                autopep8 = { enabled = true },
                flake8 = { enabled = true, ignore = { "E501" } },
                pydocstyle = { enabled = true, ignore = { "D100", "D103", "D101", "D102", "E501" } },
                pycodestyle = { enabled = true, ignore = { "E501" } },
                pylint = { enabled = true, args = "--errors-only" },
                rope_autoimport = {
                  enabled = true,
                  completions = { enabled = true },
                  code_actions = { enabled = true }
                }
              }
            }
          }
        }
      end

      if server == "clangd" then
        opts = {
          capabilities = capabilities,
          cmd = {
            "clangd",
            "--background-index",
            "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
            "--clang-tidy",
            "--all-scopes-completion",
            "--completion-style=detailed",
            "--header-insertion-decorators",
            "--header-insertion=iwyu",
            "--pch-storage=memory",
          },
        }
      end

      vim.lsp.enable(server)
      vim.lsp.config(server, opts)
    end


    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      }
    )
  end,
  lazy = false,
}
