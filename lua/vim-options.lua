-- api global de lua pode ser chamado com 'vim.'
-- tabela onde cada chave é uma opção do Vim
local opt = vim.opt

-- Opções boleanas
opt.relativenumber = true -- linhas relativas (meu maior xodó)
opt.expandtab = true -- substitui o tab por espaços

-- Opções funcionais
opt.mouse = ""

-- Opções de texto
opt.termguicolors = true -- Habilita cores de 24-bit no terminal
opt.wrap = true -- Quebra linha para o conteúdo ficar todo na tela
opt.linebreak = true -- Palavras que não cabem na tela serão colocadas na próxima linha

-- Opçoẽs numéricas
opt.tabstop = 2
opt.shiftwidth = 2 -- largura da identação
opt.tabstop = 2 -- largura do tab
opt.numberwidth = 2 -- largua do espaçamento da numeração das linhas

vim.diagnostic.config({
	virtual_text = true, -- mostra o erro em linha
	signs = true, -- mostra ícones na lateral
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
	},
})

vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
