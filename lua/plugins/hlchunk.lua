return {
  "shellRaining/hlchunk.nvim",
  event = "BufEnter",
  config = function()
    require("hlchunk").setup({})
  end
}
