-- https://zenn.dev/atoyr/articles/8802733f238e6d

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

return {
  "nvim-treesitter/nvim-treesitter",
  main = 'nvim-treesitter.configs', -- important
  event = "BufEnter",
  build = ":TSUpdate",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = false,
    parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
  }, 
}
