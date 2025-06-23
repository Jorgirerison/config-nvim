return {
	{
		"GCBallesteros/jupytext.nvim",
		config = function()
			require("jupytext").setup({
				style = "quarto",
				-- output_extension = "md",
				force_ft = "quarto",
				extension = "qmd",
			})
		end,
	},
	{ "jmbuhr/otter.nvim", ft = { "markdown", "quarto", "norg" } },
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"neovim/nvim-lspconfig",
		},
		ft = { "markdown", "quarto", "norg" },
		config = function()
			local quarto = require("quarto")
			quarto.setup({
				lspFeatures = {
					languages = { "python", "rust", "lua" },
					chunks = "all", -- 'curly' or 'all'
					diagnostics = {
						enabled = true,
						triggers = { "BufWritePost" },
					},
					completion = {
						enabled = true,
					},
				},
				keymap = {
					hover = "H",
					definition = "gd",
					rename = "<leader>rn",
					references = "gr",
					format = "<leader>gf",
				},
				codeRunner = {
					enabled = true,
					ft_runners = {
						bash = "slime",
					},
					default_method = "molten",
				},
			})

			vim.keymap.set(
				"n",
				"<localleader>qp",
				quarto.quartoPreview,
				{ desc = "Preview the Quarto document", silent = true, noremap = true }
			)
			-- for more keybinds that I would use in a quarto document, see the configuration for molten
			-- require("benlubas.hydra.notebook")
		end,
	},
}
