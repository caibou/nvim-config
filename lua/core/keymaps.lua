vim.g.mapleader = " "
vim.g.maplocalleader = " "

local mode_nv = { "n", "v" }
local mode_n = { "n" }
local mode_v = { "v" }
local mode_x = { "x" }

local mappings = {
  { from = "<C-d>",     to = "<C-d>zz" },
  { from = "<C-u>",     to = "<C-u>zz" },
  { from = "<C-e>",     to = "5<C-e>" },
  { from = "<C-y>",     to = "5<C-y>" },

  { from = "<C-h>",     to = ':wincmd W<CR>',    mode = mode_n },
  { from = "<C-l>",     to = ":wincmd w<CR>",    mode = mode_n },
  { from = "<C-->",     to = ":res -2<CR>",      mode = mode_n },
  { from = "<C-=>",     to = ":res +2<CR>",      mode = mode_n },
  { from = "<C-j>",     to = "5j",               mode = mode_nv },
  { from = "<C-k>",     to = "5k",               mode = mode_nv },
  { from = "J",         to = ":m '>+1<CR>gv=gv", mode = mode_v },
  { from = "K",         to = ":m '<-2<CR>gv=gv", mode = mode_v },
  { from = "<leader>p", to = [["_dP]],           mode = mode_x },
  { from = "Q",         to = "<nop>",            mode = mode_x },
}

for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end

if vim.g.vscode then
  -- vim.keymap.set("n", "F3", vscode.call('editor.action.formatSelection'), { desc = '' })

  local vscode = require('vscode-neovim')
  vim.notify = vscode.notify

  local function set_vscode_keymap(mode, key, command)
    vim.keymap.set(mode, key, string.format('<Cmd>lua require("vscode-neovim").call("%s")<CR>', command),
      { noremap = true })
  end

  set_vscode_keymap("n", "<leader><leader>", "editor.action.formatDocument")
  set_vscode_keymap("v", "<leader><leader>", "editor.action.formatSelection")
  set_vscode_keymap("n", "ca", "editor.action.quickFix")
  set_vscode_keymap("n", "gr", "editor.action.goToReferences")
  set_vscode_keymap("n", "gI", "editor.action.goToImplementation")
  set_vscode_keymap("n", "<leader>sf", "workbench.action.quickOpen")
  set_vscode_keymap("n", "<leader>ds", "workbench.action.gotoSymbol")
  set_vscode_keymap("n", "<leader>fg", "workbench.action.findInFiles")
  set_vscode_keymap("n", "[", "editor.action.marker.prev")
  set_vscode_keymap("n", "]", "editor.action.marker.next")
  set_vscode_keymap("n", "<leader>rn", "editor.action.rename")
  set_vscode_keymap("n", "<C-h>", "workbench.action.navigateLeft")
  set_vscode_keymap("n", "<C-l>", "workbench.action.navigateRight")
end
