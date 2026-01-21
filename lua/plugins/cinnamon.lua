return {
	"declancm/cinnamon.nvim",
	version = "*", -- use latest release
	opts = {
		options = {
			max_delta = {
				line = 100, -- Se o salto for maior que 2000 linhas, vai instantâneo
				column = false, -- (Opcional) Limite para movimento horizontal
				time = 1001, -- (Opcional) Se a animação for levar mais de 1000ms, cancela
			},
		},
		keymaps = {
			basic = true,
			extra = true,
		},
	},

	config = function(_, opts)
		-- 2. Inicializa o plugin com as opções definidas acima
		require("cinnamon").setup(opts)

		-- 3. Cria a regra para desativar em arquivos Markdown
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "quarto", "text", "log", "markdown", "tex" },
			callback = function()
				vim.b.cinnamon_disable = true
			end,
		})
	end,
}
