local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  {
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
    }
  },

  { "nvim-treesitter/nvim-treesitter",  build = ":TSUpdate" },

  { 'mbbill/undotree' },

  -- LSP Support
  { 'neovim/nvim-lspconfig' },             -- Required
  { 'williamboman/mason.nvim' },           -- Optional
  { 'williamboman/mason-lspconfig.nvim' }, -- Optional

  -- Autocompletion
  { 'hrsh7th/nvim-cmp' },     -- Required
  { 'hrsh7th/cmp-nvim-lsp' }, -- Required
  { 'L3MON4D3/LuaSnip' },     -- Required

  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'rafamadriz/friendly-snippets' },

  {
    'akinsho/flutter-tools.nvim',
    ft = "dart",
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  { 'theniceboy/nvim-deus' },

  { 'nvim-lualine/lualine.nvim' },
  { 'nvim-tree/nvim-web-devicons' },

  -- Nice to have
  { "numToStr/Comment.nvim" },
  { "j-hui/fidget.nvim" },

  -- Explore
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
  },

  -- TabBar
  { 'akinsho/bufferline.nvim', version = "*" },

  require('plugins.auto_pairs'),
  require('plugins.dart-vim'),


  -- Git
  { 'f-person/git-blame.nvim' },
})
