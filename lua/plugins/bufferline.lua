return {
  "akinsho/bufferline.nvim",
  version = "*",
  config = function()
    require("bufferline").setup {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
          }
        }
      }
    }
  end
}
