vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>w", ":write<CR>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y', { noremap = true, silent = true })
