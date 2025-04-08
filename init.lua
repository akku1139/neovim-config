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

--- Error Lens
-- https://neovim.io/doc/user/diagnostic.html#vim.diagnostic.show()
-- https://www.reddit.com/r/neovim/comments/127m35b/errorlens_for_nvim/
-- https://zenn.dev/izumin/articles/744b9ec61b6b82
vim.diagnostic.config({
  virtual_text = true
})
