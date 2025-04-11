-- https://zenn.dev/atoyr/articles/8802733f238e6d

return {
  "nvim-treesitter/nvim-treesitter",
  main = 'nvim-treesitter.configs', -- important
  event = "BufEnter",
  build = ":TSUpdate",
  opts = {
    highlight = { enable = true },
    auto_install = true,
    parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
  }, 
}
