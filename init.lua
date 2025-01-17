require("config.lazy")

vim.o.number = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.cmd("source ~/.config/nvim/vim.vim")

require("config.lsp")
