-- Leader
vim.g.mapleader = ","

-- Swap : and ;
vim.keymap.set("n", ":", ";")
vim.keymap.set("n", ";", ":")

-- NERDTree replacement already mapped to <F2>
-- (If using nvim-tree, already mapped earlier)

-- Disable arrow keys
vim.keymap.set("n", "<Left>", ':echo "Use H"<CR>')
vim.keymap.set("n", "<Right>", ':echo "Use L"<CR>')
vim.keymap.set("n", "<Up>", ':echo "Use K"<CR>')
vim.keymap.set("n", "<Down>", ':echo "Use J"<CR>')

-- Window navigation
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")

-- jk to escape
vim.keymap.set("i", "jk", "<ESC>")

-- Quit
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- Remove search highlight
vim.keymap.set("n", "<leader><CR>", ":noh<CR>")
