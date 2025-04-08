local M = {}

-- TODO: Automatically create parent directory

M.create_directory_if_symlink_target_not_exist = function(p)
  local is_symlink = vim.uv.fs_lstat(p) and vim.uv.fs_lstat(p).type == "link"

  if is_symlink then
    local target_path = vim.uv.fs_readlink(p)
    local target_stat = vim.uv.fs_stat(target_path)

    if not target_stat then
      local ok, err = vim.uv.fs_mkdir(target_path, tonumber("700", 8))
      if not ok then
        vim.notify("failed to mkdir: " .. err, vim.log.levels.ERROR)
      end
    end
  end
end

M.get_data_path = function(p)
  local path = vim.fn.stdpath("data") .. "/" .. p
  M.create_directory_if_symlink_target_not_exist(path)
  return path
end

return M
