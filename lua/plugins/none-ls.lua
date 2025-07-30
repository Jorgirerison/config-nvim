return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.rubocop,
					null_ls.builtins.diagnostics.rubocop,
					null_ls.builtins.diagnostics.mypy,
					require("none-ls.diagnostics.eslint"), -- <- substituição correta aqui
					require("none-ls.diagnostics.flake8"), -- <- substituição correta aqui
				},
			})

			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
			vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set("n", "<leader>gg", vim.lsp.buf.hover, { desc = "" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition"})
			vim.keymap.set("n", "<leader>gp", vim.diagnostic.goto_prev, { desc = "[G]o to [P]revious diagnostic" })
			vim.keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, { desc = "[G]o to [N]ext diagnostic" })
		end,
	},
}
