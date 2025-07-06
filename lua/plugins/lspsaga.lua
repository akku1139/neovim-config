-- TODO: https://zenn.dev/botamotch/articles/c02c51cff7d61d

return {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
  },
  event = "LspAttach",
  config = function()
    require('lspsaga').setup({})
  end,
}
