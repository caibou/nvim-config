require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = false,
}

vim.g.gitblame_message_template = '<date> • <author>'
vim.g.gitblame_data_format = '%r'
vim.g.gitblame_virtual_text_column = 150
