local success, lspSettings = pcall(require, "lsp-settings")
if not success then
  lspSettings = require("lsp-settings-default")
end

return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }

    if lspSettings.jdtls then
      -- jdtls
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })
    end


    if lspSettings.pylsp then
      -- python-lsp-server python-rope python-pyflakes python-mccabe python-pycodestyle python-pydocstyle autopep8 flake8 python-pylint  python-lsp-isort
      require 'lspconfig'.pylsp.setup {
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

    if lspSettings.bashls then
      -- bash-language-server
      lspconfig.bashls.setup({
        capabilities = capabilities
      })
    end

    if lspSettings.lua_ls then
      -- lua-language-server
      lspconfig.lua_ls.setup({
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
      })
    end

    if lspSettings.ts_ls then
      -- npm install -g typescript typescript-language-server
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
    end

    if lspSettings.html then
      -- npm i -g vscode-langservers-extracted
      lspconfig.html.setup({
        capabilities = capabilities,
      })
    end

    if lspSettings.cssls then
      -- npm i -g vscode-langservers-extracted
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
    end

    if lspSettings.eslint then
      -- npm i -g vscode-langservers-extracted
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
    end

    if lspSettings.jsonls then
      -- npm i -g vscode-langservers-extracted
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })
    end

    if lspSettings.emmet_ls then
      -- npm install -g emmet-ls
      lspconfig.emmet_ls.setup({
        capabilities = capabilities
      })
    end

    if lspSettings.clangd then
      -- clang
      lspconfig.clangd.setup({
        capabilities = capabilities,
        cmd = {
          "clangd",
          "--clang-tidy",
        },
      })
    end

    if lspSettings.dockerls then
      -- npm install -g dockerfile-language-server-nodejs
      lspconfig.dockerls.setup({
        capabilities = capabilities,
      })
    end

    if lspSettings.docker_compose_language_service then
      -- npm install @microsoft/compose-language-service
      lspconfig.docker_compose_language_service.setup({
        capabilities = capabilities,
      })
    end

    if lspSettings.autotools_ls then
      -- autotools-language-server
      lspconfig.autotools_ls.setup({
        capabilities = capabilities
      })
    end

    if lspSettings.cmake then
      -- cmake-language-server
      lspconfig.cmake.setup({
        capabilities = capabilities
      })
    end


    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
      }
    )
  end,
  lazy = false,
}
