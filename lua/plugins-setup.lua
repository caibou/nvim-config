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

local vscodePlugins = {
  require('plugins.comment'),
  require('plugins.dart-vim'),
  require('plugins.course'),
}

local fullPlugins = {
  require('plugins.telescope'),
  require('plugins.nvim-treesitter'),


  -- LSP Support
  require('plugins.lsp'),
  require('plugins.mason'),
  require('plugins.completion'),
  require('plugins.flutter'),
  require('plugins.course'),

  require('plugins.colorscheme'),
  require('plugins.lualine'),
  require('plugins.highlight'),

  { 'nvim-tree/nvim-web-devicons' },
  { 'mbbill/undotree' },

  -- Nice to have
  require('plugins.comment'),

  -- Explore
  require('plugins.explore'),

  -- TabBar
  require('plugins.bufferline'),

  require('plugins.auto_pairs'),
  require('plugins.dart-vim'),

  -- Git
  require('plugins.git'),
}


if vim.g.vscode then
  require("lazy").setup(vscodePlugins)
else
  require("lazy").setup(fullPlugins)
end
