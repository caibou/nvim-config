return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- change a keymap
    keys[#keys + 1] = { mode = { "n", "v" }, "ca", vim.lsp.buf.code_action }
    keys[#keys + 1] = { "<leader>rn", vim.lsp.buf.rename }
    -- add a keymap
    keys[#keys + 1] = { "<F3>", vim.lsp.buf.format }
    keys[#keys + 1] = { "<leader>h", vim.lsp.buf.signature_help }
    keys[#keys + 1] = { "<leader>ds", vim.lsp.buf.document_symbol }
    return opts
  end,
}
