local dir = require("utils.dir")

local l = require'lspconfig'

local node_path = dir.get_data_path("/lsp/node")
local node_modules_path = node_path .. "/node_modules/"

local function use_pnpm(config, pkg)
  --- install packages
  -- FIXME: before_init hook is executed after the command is executed
  -- local before_init = function(p, c)
    for _index, value in ipairs(pkg) do
      -- local org_before_init = config.config_def.default_config.before_init
      -- if org_before_init then
      --   org_before_init(p, c)
      -- end

      local stat = vim.uv.fs_lstat(node_modules_path .. value)
      if not stat then -- and stat.type == "directory"
        print("installing npm package: " .. value)
        vim.system { "pnpm", "-C", node_path, "install", value }
      end
    end
  -- end

  local newcmd = vim.tbl_deep_extend("keep", config.config_def.default_config.cmd, {})
  newcmd[1] = node_modules_path .. "/.bin/" .. newcmd[1]

  config.setup {
    cmd = newcmd,
    -- before_init = before_init,
  }
end

--- TypeScript
--- TODO: use https://github.com/pmizio/typescript-tools.nvim
use_pnpm(l.ts_ls, { "typescript", "typescript-language-server" })

--- Svelte
-- npm: svelte-language-server
-- l.svelte.setup{}
-- let g： svelte_indent_script = 0
-- let g： svelte_indent_style = 0

--- Lua
-- termux-apt: lua-language-server
-- l.lua_ls.setup{}

-- Python
use_pnpm(l.pyright, { "pyright" })
