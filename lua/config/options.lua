vim.opt.number = true

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.o.linebreak = true
vim.o.breakindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevelstart = 20
vim.opt.foldnestmax = 4

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.autowriteall = true

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.clipboard = "unnamedplus"
vim.opt.inccommand = "split"
