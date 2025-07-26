local dir = require("utils.dir")

vim.uv.fs_mkdir(vim.fn.stdpath("cache"), tonumber("700", 8))
dir.create_directory_if_symlink_target_not_exist(vim.fn.stdpath("state"))

require("config.lazy")

vim.o.number = true
-- vim.o.numberwidth = 5

-- do not make layout shift with gitsigns
-- https://www.reddit.com/r/neovim/comments/xjakdy/neovim_gitsigndiagnostic_icons_causes_layout_shift/
vim.o.signcolumn = "yes"

vim.o.expandtab = true
vim.o.tabstop = 8
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

-- https://golang.hateblo.jp/entry/2023/04/20/201352
local function smart_home()
  -- カーソルがある行を文字列で取得
  local line = vim.api.nvim_get_current_line()
  -- 現在のカーソル位置を取得
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  -- 先頭にある空白と制御文字(タブ)にマッチさせる。戻り値はマッチした文字列または nil
  local m = line:match('^[%s%c]+')
  -- カーソルを移動させる(三項演算子で読みづらいけどluaでよく見るので)
  vim.api.nvim_win_set_cursor(0, (m ~= nil and (col == 0 or m:len() < col)) and { row, m:len() } or { row, 0 })
end

vim.api.nvim_set_keymap('n', '<Home>', '', { callback = smart_home })
vim.api.nvim_set_keymap('i', '<Home>', '', { callback = smart_home })
vim.api.nvim_set_keymap('v', '<Home>', '', { callback = smart_home })

require("local.main")

