return {
  'f-person/git-blame.nvim',
  config = function()
    require('gitblame').setup {
      enabled = true,
    }
    vim.g.gitblame_message_template = '<date> • <author>'
    vim.g.gitblame_data_format = '%r'
    vim.g.gitblame_virtual_text_column = 100
  end
}
