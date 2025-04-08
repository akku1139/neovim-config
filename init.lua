require("config.lazy")

vim.o.number = true
-- vim.o.numberwidth = 5

-- do not make layout shift with gitsigns
-- https://www.reddit.com/r/neovim/comments/xjakdy/neovim_gitsigndiagnostic_icons_causes_layout_shift/
vim.o.signcolumn = "yes"

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.cmd("source ~/.config/nvim/vim.vim")

require("config.lsp")
