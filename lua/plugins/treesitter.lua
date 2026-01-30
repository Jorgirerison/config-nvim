return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				-- O básico do Neovim
				"lua",
				"vim",
				"vimdoc",
				"query",

				-- Documentação e config
				"markdown",
				"markdown_inline",
				"yaml",

				-- O Combo Django/Web (Essencial)
				"htmldjango", -- Lida com {% ... %}
				"html", -- Lida com as tags <div>, <body>
				"python", -- Lida com a lógica dentro do Django
				"css", -- Para <style> dentro do HTML
				"javascript", -- Para <script>
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
