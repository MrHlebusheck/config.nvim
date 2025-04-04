return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }

    require("mason").setup({})
    require("mason-lspconfig").setup_handlers({
      function(server)
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
              "--clang-tidy",
            },
          }
        end

        lspconfig[server].setup(opts)
      end
    })

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      }
    )
  end,
  lazy = false,
}
