-- MAPPINGS
-- Note: <CR> is carriage return or enter
vim.g.mapleader = " " -- set leader key to space

vim.keymap.set("n", "<c-s>", ":w<CR>", { noremap = true }) -- save file with <ctrl> + s
vim.keymap.set("n", "<c-q>", ":q<CR>", { noremap = true }) -- quit file with <ctrl> + q

vim.keymap.set("n", "<c-d>", "<c-d>zz", { noremap = true }) -- scroll down with <ctrl> + d and keep cursor in the middle
vim.keymap.set("n", "<c-u>", "<c-u>zz", { noremap = true }) -- scroll up with <ctrl> + u and keep cursor in the middle

vim.keymap.set("n", "<a-j>", ":m .+1<CR>==", { noremap = true }) -- move line down with <alt> + j
vim.keymap.set("n", "<a-k>", ":m .-2<CR>==", { noremap = true }) -- move line up with <alt> + k
vim.keymap.set("v", "<a-j>", ":m '>+1<CR>gv=gv", { noremap = true }) -- move lines down with <alt> + j
vim.keymap.set("v", "<a-k>", ":m '<-2<CR>gv=gv", { noremap = true }) -- move lines up with <alt> + k

vim.keymap.set("n", "<leader>t", ":Explore<CR>", { noremap = true}) -- open netrw with <leader> + t
vim.keymap.set("n", "<leader>md", ":MarkdownPreviewToggle<CR>", { noremap = true}) -- open :MarkdownPreviewToggle with <leader> + m + d
