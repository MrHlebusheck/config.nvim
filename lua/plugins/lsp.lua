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

    for i, server in ipairs(mason_lspconfig.get_installed_servers()) do
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
                flake8 = { enabled = true },
                -- pydocstyle = { enabled = true, ignore = {"D100", "D103"} },
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
