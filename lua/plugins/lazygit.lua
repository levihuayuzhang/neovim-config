-- https://github.com/kdheepak/lazygit.nvim

return {
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "open lazygit" })
		end,
	},
}
