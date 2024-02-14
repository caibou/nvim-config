return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  }, -- Optional
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      local lspconfig = require('lspconfig')

      local default_setup = function(server)
        lspconfig[server].setup({})
      end

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          default_setup,
          lua_ls = function()
            lspconfig.lua_ls.setup({
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT'
                  },
                  diagnostics = {
                    globals = { 'vim' },
                  },
                  workspace = {
                    library = {
                      vim.env.VIMRUNTIME,
                    }
                  }
                }
              }
            })
          end,
        },
      })
    end
  }, -- Optional
}
