return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					javjavascript = { "prettierd" },
					typescript = { "prettierd" },
					typescriptreact = { "prettierd" },
					css = { "prettierd" },
					html = { "prettierd" },
					json = { "prettierd" },
					yaml = { "prettierd" },
					markdown = { "prettierd" },
					graphql = { "prettierd" },
					ascript = { { "prettierd", "prettier" } },
					go = { "goimports", "gofmt" },
					-- Use the "*" filetype to run formatters on all filetypes.
					["*"] = { "codespell" },
					-- Use the "_" filetype to run formatters on filetypes that don't
					-- have other formatters configured.
					["_"] = { "trim_whitespace" },
				},
				format_on_save = {
					pattern = ".lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs",
					timeout_ms = 500,
					async = false,
					lsp_fallback = true,
				},
				format_after_save = {
					lsp_fallback = true,
				},
				notify_on_error = true,
				log_level = vim.log.levels.ERROR,
			})

			-- format on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end,
	},
}
