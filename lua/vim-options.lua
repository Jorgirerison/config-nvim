-- api global de lua pode ser chamado com 'vim.'
-- tabela onde cada chave é uma opção do Vim
local opt = vim.opt
local add = vim.filetype.add

-- reconher log como arquivo
add({
	extension = {
		log = "log",
		-- Aqui você pode adicionar outras no futuro
		conf = "conf",
		env = "sh",
	},
})

-- Opções boleanas
opt.relativenumber = true -- linhas relativas (meu maior xodó)
opt.expandtab = true -- substitui o tab por espaços
-- opção ligada ao matchtime
-- (default)
-- opt.showmatch = false -- opção relacionada ao destaque no fechamento do parentese

-- Opções funcionais
opt.mouse = ""

-- Opções de texto
opt.termguicolors = true -- Habilita cores de 24-bit no terminal
opt.wrap = true -- Quebra linha para o conteúdo ficar todo na tela
opt.linebreak = true -- Palavras que não cabem na tela serão colocadas na próxima linha
opt.incsearch = true

-- Opçoẽs numéricas
opt.tabstop = 2
-- opção abaixo descreve o tempo de 0.5 s
-- ao escrever o fechamento de um parentese o cursor
-- teleporta automaticamente para o primeiro
-- parentese quando showmatch está ativo
-- (default)
-- opt.matchtime = 5

-- devido a opção abaixo
-- keymaps de identação em keymaps.lua
-- afim de identar no modo de inserção
opt.shiftwidth = 2 -- Tamanho da indentação (para >>, <<)

opt.tabstop = 2 -- largura do tab
opt.numberwidth = 5 -- largura do espaçamento da numeração das linhas
opt.scrolloff = 3 -- limita o cursor quando scrollar

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
