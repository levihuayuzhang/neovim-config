-- https://github.com/folke/edgy.nvim

return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end
}
