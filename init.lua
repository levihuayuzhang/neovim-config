-- lazy.vim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- lazy.vim managed plugins
local plugins = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    "folke/which-key.nvim",
}
local opts = {}

-- enable lazy.vim
require("lazy").setup(plugins, opts)

vim.cmd.colorscheme "catppuccin"

-- traditional vim options
local opt = vim.opt
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.number = true
opt.relativenumber = true
opt.autowrite = true
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.laststatus = 3
opt.list = true
opt.scrolloff = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.showmode = false
opt.sidescrolloff = 8
opt.smartcase = true
opt.smartindent = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.wrap = false
opt.winminwidth = 5

