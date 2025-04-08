local dir = require("utils.dir")

local l = require'lspconfig'

local node_path = dir.get_data_path("/lsp/node")
local node_modules_path = node_path .. "/node_modules/"

-- TODO: Run the actual install command when using ls
local function use_pnpm(config, pkg)
  -- install packages
  for _index, value in ipairs(pkg) do
    local stat = vim.uv.fs_lstat(node_modules_path .. value)
    if not stat then -- and stat.type == "directory"
      -- https://www.reddit.com/r/neovim/comments/y2by27/is_there_a_way_to_run_terminal_commands_with_lua/
      print("installing npm package: " .. value)
      vim.system { "pnpm", "-C", node_path, "install", value }
    end
  end

  local newcmd = vim.tbl_deep_extend("keep", config.config_def.default_config.cmd, {})
  newcmd[1] = node_modules_path .. "/.bin/" .. newcmd[1]

  config.setup {
    cmd = newcmd
  }
end

--- TypeScript
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
