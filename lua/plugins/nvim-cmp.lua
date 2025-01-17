return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
  },
  ---@param opts cmp.ConfigSchema
  opts = {
    sources = {
      { name = "emoji" },
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    },
  },
}

