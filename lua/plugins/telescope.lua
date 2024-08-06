local ui_select_extension_name = "ui-select"
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-ui-select.nvim" },
  },
  keys = {
    { "<leader>sf", LazyVim.telescope("find_files"), desc = "Find Files (Root Dir)" },
    { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix List" },
    { "<leader>fg", LazyVim.telescope("live_grep"), desc = "Grep (Root Dir)" },
    {
      "<leader>ss",
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
        })
      end,
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
          symbols = require("lazyvim.config").get_kind_filter(),
        })
      end,
      desc = "Goto Symbol (Workspace)",
    },
    {
      "<leader>gr",
      require("telescope.builtin").lsp_references,
      desc = "Goto Symbol References",
    },
    {
      "<leader>gI",
      require("telescope.builtin").lsp_implementations,
      desc = "Goto Symbol Implementations",
    },
  },
  opts = {
    extensions = {
      [ui_select_extension_name] = {
        specific_opts = {
          cadeactions = false,
        },
      },
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension(ui_select_extension_name)
  end,
}
