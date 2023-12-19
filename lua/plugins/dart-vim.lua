local pluginName = "dart-lang/dart-vim-plugin"
return {
  pluginName,
  config = function()
    vim.g.dart_html_in_string = true
    vim.g.dart_style_guide = true
    vim.g.dart_format_on_save = false
  end
}
