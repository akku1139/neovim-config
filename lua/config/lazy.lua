local function create_directory_if_symlink_target_not_exist(p)
  local is_symlink = vim.loop.fs_stat(p) and vim.loop.fs_stat(p).type == "symlink"

  if is_symlink then
    local target_path = vim.loop.fs_readlink(p)
    local target_stat = vim.loop.fs_stat(target_path)

    if not target_stat or target_stat.type ~= "directory" then
      local ok, err = vim.loop.fs_mkdir(target_path)
      if not ok then
        vim.notify("failed to mkdir: " .. err, vim.log.levels.ERROR)
      end
    end
  end
end

create_directory_if_symlink_target_not_exist(vim.fn.stdpath("data") .. "/lazy/")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
  defaults = {
    lazy = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
})
