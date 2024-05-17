return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.3',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    -- Neovim core fun in telescope (code action)
    { "nvim-telescope/telescope-ui-select.nvim" }
  },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>tb", builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set("n", "<leader>to", builtin.oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set("n", "<leader>tlb", function()
      builtin.git_branches({ show_remote_tracking_branches = false })
    end, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set("n", "<leader>tlrb", builtin.git_branches, {})
    vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>tc", builtin.commands, {})
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

    vim.keymap.set("n", "<leader>sf", builtin.find_files, {})

    local telescope = require('telescope')
    telescope.setup({
      -- defaults = require("telescope.themes").get_dropdown({
      -- 	file_sorter = require("telescope.sorters").get_fzy_sorter,
      -- 	file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      -- 	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      -- 	qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- 	mappings = {
      -- 		i = {
      -- 			["<C-x>"] = false,
      -- 		},
      -- 	},
      -- }),
      defaults = {
        layout_config = {
          width = 0.9,
          height = 0.9,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        ["ui-select"] = {
          specific_opts = {
            codeactions = false,
          },
        },
      },
    })

    require("telescope").load_extension("ui-select")
    require('telescope').load_extension('fzf')
    -- require("telescope").load_extension("flutter")
  end
}
