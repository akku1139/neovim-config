local dir = require "utils.dir"

-- https://zenn.dev/atoyr/articles/8802733f238e6d

return {
  "nvim-treesitter/nvim-treesitter",
  main = 'nvim-treesitter.configs', -- important
  event = "BufEnter",
  build = ":TSUpdate",
  opts = {
    highlight = { enable = true },
    parser_install_dir = dir.get_data_path("treesitter-parsers"),
    auto_install = true,
  }, 
}
