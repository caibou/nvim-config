vim.g.mapleader = " "
vim.g.maplocalleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_x = { "x" }

local mappings = {
  { from = "<C-d>", to = "<C-d>zz" },
  { from = "<C-u>", to = "<C-u>zz" },
  { from = "<C-e>", to = "4<C-e>" },
  { from = "<C-y>", to = "4<C-y>" },
  { from = "tt", to = ":NvimTreeFindFileToggle<CR>", mode = mode_nv },
  { from = "J", to = ":m '>+1<CR>gv=gv", mode = mode_v},
  { from = "K", to = ":m '<-2<CR>gv=gv", mode = mode_v},
  { from = "<leader>p", to = [["_dP]], mode = mode_x},
  { from = "Q", to = "<nop>", mode = mode_x},
}

for _, mapping in ipairs(mappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
