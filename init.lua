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

-- https://zenn.dev/simpleform_blog/articles/20241202-neovim_python_lsp
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function()
    local utils = require "utils.project"
    utils.wait_for_lsp("pyright", function()
      local current_file_path = vim.fn.expand "%:p:h"
      local venv_path = utils.recursive_find_project_root(current_file_path, ".venv")

      if venv_path == nil then
        vim.notify("No virtual environment found in current or parent directories.", vim.log.levels.WARN)
        return
      end

      require("venv-selector").activate_from_path(string.format("%s/bin/python", venv_path))
    end)
  end,
})

