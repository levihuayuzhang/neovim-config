local g = vim.g
local opt = vim.opt

g.encoding = "UTF-8"
opt.fileencoding = "utf-8"

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.number = true
opt.relativenumber = true
opt.autowrite = true
opt.autoread = true
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.ignorecase = true
opt.inccommand = "nosplit"
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

-- -- highlight on yank
-- vim.api.nvim_create_autocmd("TextYankPost", {
--     callback = function()
--         vim.highlight.on_yank()
--     end,
-- })
