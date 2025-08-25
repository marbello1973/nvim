return {
  "folke/tokyonight.nvim",
  { "ntk148v/habamax.nvim", dependencies = { "rktjmp/lush.nvim" } },
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
}
