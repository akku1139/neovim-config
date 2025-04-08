return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufEnter",
  opts = function(_, opts)
    -- Other blankline configuration here
    return require("indent-rainbowline").make_opts(opts)
  end,
  dependencies = {
    "TheGLander/indent-rainbowline.nvim",
  },
}
