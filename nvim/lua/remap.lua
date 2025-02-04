-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc='select lines and move them vertically'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc='select lines and move them vertically'})

vim.keymap.set("n", "J", "mzJ`z", {desc='delete /n but stay cursor in place'})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc='half page move but cursor stays in the middle'})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc='half page move but cursor stays in the middle'})

vim.keymap.set("n", "n", "nzzzv", {desc='search term stays in the middle'})
vim.keymap.set("n", "N", "Nzzzv", {desc='search term stays in the middle'})

vim.keymap.set("x", "<leader>p", [["_dP]], {desc='paste but leave content in same register so you can paste again'})

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {desc='yank to system clipboard'})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc='yank to system clipboard'})

vim.keymap.set("i", "<C-c>", "<Esc>", {desc='leave insert mode with ctrl+C'})

vim.keymap.set("n", "<C-j>", "<C-W>j", {}, {desc='pane select'})
vim.keymap.set("n", "<C-k>", "<C-W>k", {}, {desc='pane select'})
vim.keymap.set("n", "<C-h>", "<C-W>h", {}, {desc='pane select'})
vim.keymap.set("n", "<C-l>", "<C-W>l", {}, {desc='pane select'})

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", {desc='cell auto rain'})
