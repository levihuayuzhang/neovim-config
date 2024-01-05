-- keymaps
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

vim.g.mapleader = ' '
local map = vim.keymap


map.set('n', '<c-a>', 'ggVG', { desc = 'select all text' })
map.set({ 'n', 'x' }, '<leader>p', '"0p', { desc = 'paste only from copy not delete' })
map.set('n', '<leader>l', '<cmd>Lazy<CR>', { desc = 'Show lazy.vim' })
map.set('n', '<leader>q', '<cmd>q<cr>', { desc = 'quick quit' })
map.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
map.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'quick write (save)' })
map.set('n', '<leader>x', '<cmd>x<cr>', { desc = 'quick exit (close current buffer)' })

-- better up/down
map.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

map.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })
map.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

map.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
-- highlights under cursor
map.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- better indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- windows
map.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map.set("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
map.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })


map.set('n', '<leader>nh', ':nohl<CR>', { desc = 'clear search highlights' })
