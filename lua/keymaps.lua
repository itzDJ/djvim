-- MAPPINGS
-- Note: <CR> is carriage return (i.e. the enter key)
vim.g.mapleader = " " -- set leader key to space
vim.keymap.set("n", "<leader>t", ":Explore<CR>", { noremap = true }) -- open netrw with <leader> + t

vim.keymap.set("n", "<c-j>", ":m .+1<CR>==", { noremap = true }) -- move line down with <ctrl> + j
vim.keymap.set("n", "<c-k>", ":m .-2<CR>==", { noremap = true }) -- move line up with <ctrl> + k
vim.keymap.set("v", "<c-j>", ":m '>+1<CR>gv=gv", { noremap = true }) -- move lines down with <ctrl> + j
vim.keymap.set("v", "<c-k>", ":m '<-2<CR>gv=gv", { noremap = true }) -- move lines up with <ctrl> + k

vim.keymap.set("n", "<leader>y", '"+y', { noremap = true }) -- copy to clipboard with <leader> + y (with optional count before and required motion after just like y)
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true }) -- copies highlighted text to clipboard with <leader> + y
