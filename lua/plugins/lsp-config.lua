return {
	{ -- for lsp features in code cells / embedded code
		"jmbuhr/otter.nvim",
		dev = false,
		dependencies = {
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- NOVO: Adicionado para instalar LSPs, depuradores, etc. de forma centralizada
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				-- Lista unificada de todas as ferramentas a serem instaladas
				ensure_installed = {
					-- Suas ferramentas
					"lua_ls",
					"pyright",
					-- Ferramentas do vídeo
					"jdtls", --
					"java-debug-adapter", --
					"java-test", --
					"bashls", --
					"cssls", --
					"html", --
					"jsonls", --
				},
			})
			-- Comando para corrigir problema de timing com lazy-loading
			vim.api.nvim_command("MasonToolsInstall")
		end,
	},
	-- MODIFICADO: Bloco principal de configuração do LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			-- Plugins opcionais, mas úteis, do vídeo
			{ "j-hui/fidget.nvim", opts = {} }, --
			{ "folke/neodev.nvim", opts = {} }, --
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Configuração automática de LSPs instalados pelo Mason
			require("mason-lspconfig").setup({
				-- Função que roda para cada servidor
				function(server_name)
					-- Ignora o 'jdtls' para configuração manual em outro lugar
					if server_name ~= "jdtls" then
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end
				end,
			})

			-- Configuração específica para o LuaLS para reconhecer o `vim` global
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
							-- workspace = {
							-- 	library = vim.api.nvim_get_runtime_file("", true),
							-- },
							-- runtime = {
							-- 	version = "LuaJIT",
							-- },
						},
					},
				},
			})
		end,
	},
}
