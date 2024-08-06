local preview_stack_trace = function()
  local line = vim.api.nvim_get_current_line()
  local pattern = "package:[^/]+/([^:]+):(%d+):(%d+)"
  local filepath, line_nr, column_nr = string.match(line, pattern)
  if filepath and line_nr and column_nr then
    vim.cmd(":wincmd k")
    vim.cmd("e " .. filepath)
    vim.api.nvim_win_set_cursor(0, { tonumber(line_nr), tonumber(column_nr) })
    vim.cmd(":wincmd j")
  end
end

function toggle_log()
  local wins = vim.api.nvim_list_wins()

  for _, id in pairs(wins) do
    local bufnr = vim.api.nvim_win_get_buf(id)
    if vim.api.nvim_buf_get_name(bufnr):match(".*/([^/]+)$") == "__FLUTTER_DEV_LOG__" then
      return vim.api.nvim_win_close(id, true)
    end
  end

  pcall(function()
    vim.api.nvim_command("sb + __FLUTTER_DEV_LOG__ | resize 15 | wincmd J")
  end)
end

-- 定义执行FlutterRun命令的函数
function run_flutter()
  vim.cmd("FlutterRun --dart-define-from-file=launch_config_dev.json")
end

return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local flutter = require("flutter-tools")
    flutter.setup({
      fvm = true,
      widget_guides = {
        enabled = true,
      },
      ui = {
        border = "rounded",
        notification_style = "nvim-notify",
      },
      decorations = {
        statusline = {
          app_version = false,
          device = true,
          project_config = false,
        },
      },
      dev_log = {
        enabled = true,
        notify_errors = false, -- if there is an error whilst running then notify the user
        open_cmd = "split", -- command to use to open the log buffer
      },
      lsp = {
        capabilities = capabilities,
        settings = {
          enableSnippets = true,
          showTodos = true,
          completeFunctionCalls = true,
          analysisExcludedFolders = {
            vim.fn.expand("$HOME/.pub-cache"),
            vim.fn.expand("$HOME/fvm"),
          },
          lineLength = 100,
          renameFilesWithClass = "prompt",
          updateImportsOnRename = true,
          onlyAnalyzeProjectsWithOpenFiles = false,
        },
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
          background = false, -- highlight the background
          foreground = false, -- highlight the foreground
          virtual_text = true, -- show the highlight using virtual text
          virtual_text_str = "■", -- the virtual text character to highlight
        },
      },
      root_patterns = { "pubspec.yaml" },
    })

    local telescope_name = "telescope"

    -- 检查是否安装了Telescope插件
    local telescope_installed = pcall(require, telescope_name)
    -- 如果Telescope插件可用，则加载flutter扩展
    if telescope_installed then
      local telescope = require(telescope_name)
      telescope.load_extension("flutter")
      vim.keymap.set("n", "<leader>fl", telescope.extensions.flutter.commands, { noremap = true, silent = true })
    end

    vim.keymap.set("n", "<F5>", ":lua run_flutter()<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>lg", ":lua toggle_log()<CR>", { noremap = true, silent = true })
  end,
}
