-- https://github.com/folke/edgy.nvim

return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    -- views can only be fully collapsed with the global statusline
    vim.opt.laststatus = 3
    -- Default splitting will cause your main splits to jump when opening an edgebar.
    -- To prevent this, set `splitkeep` to either `screen` or `topline`.
    vim.opt.splitkeep = "screen"
  end
}
