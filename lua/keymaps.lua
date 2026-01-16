local map = vim.keymap.set
local system = vim.fn.system

-- Por padrão a função map já vem com o parametro
-- não recursivo true, como: noremap = true

-- =============================================================================
-- MAPEAMENTOS GERAIS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Formatações (Modo NORMAL)
-- -----------------------------------------------------------------------------

-- Abrir linha abaixo sem entrar no modo de inserção
-- map("n", "no", "o<Esc>", { desc = "Open line below" })

-- Abrir linha abaixo sem entrar no modo de inserção
-- map("n", "nO", "O<Esc>", { desc = "Open line above" })

-- Deixa palavra atual entre ""
map("n", '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', { desc = "Focus word between aspas" })

-- Deixar a palavra atual maiúscula
map("n", "<leader>u", "viwUe<esc>", { desc = "Focus word in Uppercase" })

-- Deixa palavra atual entre ``
map("n", "<leader>`", "viw<esc>a`<esc>bi`<esc>lel", { desc = "Focus word between crase" })

-- Deixa palavra atual entre * *
map("n", "<C-i>", "viw<esc>a*<esc>bi*<esc>lel", { desc = "Focus word between crase" })

-- -- Deixa palavra atual **entre** ** **
-- map("n", "<C-b>", "viw<esc>a**<esc>Bi**<esc>E", { desc = "Focus word between crase" })

-- Deixa palavra atual entre ()
map("n", "<leader>)", "viw<esc>a)<esc>Bi(<esc>lEl", { desc = "Focus word between brackets" })

-- Copiar linha para o sistema com <Leader> + y
map("n", "<leader>y", '"+yy')

-- tentando exec código em python
map("n", "<leader>r", function()
	-- 1. Salva o arquivo
	vim.cmd("write")

	-- 2. Pega o caminho completo do arquivo
	local file_path = vim.fn.expand("%:p")

	-- 3. Monta o comando direcionado ao alvo "term"
	-- -t term : Procura uma janela ou sessão nomeada "term"
	local cmd = 'tmux send-keys -t term "python ' .. file_path .. '" C-m'

	-- 4. Executa
	system(cmd)

	-- (Opcional) Se você quiser que o cursor PULE para a janela term automaticamente:
	system("tmux select-window -t term")
end, { desc = "Executar python na janela term" })

-- -----------------------------------------------------------------------------
-- Formatações (Modo de INSERÇÃO)
-- -----------------------------------------------------------------------------

-- Comandos padrões por conta da propriedade:
-- opt.shiftwidth
-- ctrl + t : identa no modo de inserção
-- ctrl + d : identa para trás no modo de inserção

-- -----------------------------------------------------------------------------
-- Interações com o buffer (Modo NORMAL)
-- -----------------------------------------------------------------------------

-- Salvar buffer
map("n", "<C-s>", ":w<CR>", { desc = "Write buffer" })

-- Selecionar todo o buffer
map("n", "<C-a>", "ggVG", { desc = "Select all content" })

-- Fechar o buffer (aba)
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Buffer delete" })

-- Salvar buffer atual e sair
map("n", "<leader>w", ":w<CR>", { desc = "Save buffer" })

-- Salvar todos os buffers e sair
map("n", "<leader>W", ":wa<CR>", { desc = "Save all buffers" })

-- Forçar saída de todos os buffers
map("n", "<leader>q", ":q<CR>", { desc = "[q]uit", silent = true })

-- Forçar saída de todos os buffers
map("n", "<leader>Q", ":qa!<CR>", { desc = "[Q]uit [A]ll (forçar saída)", silent = true })

-- Criar novo arquivo
map("n", "t", ":enew<CR>", { desc = "Create new buffer" })

-- Nome do arquivo
map("n", "<leader>yp", function()
	vim.fn.setreg("+", vim.fn.expand("%"))
	print("Caminho completo copiado: " .. vim.fn.expand("%:p"))
end, { desc = "[y]ank [p]ath do arquivo" })

-- Nome do diretório
vim.keymap.set("n", "<leader>yf", function()
	vim.fn.setreg("+", vim.fn.expand("%:t"))
	print("Nome do arquivo copiado: " .. vim.fn.expand("%:t"))
end, { desc = "[y]ank [f]ilename do arquivo" })

-- Setar o relative number num buffer
map("n", "<leader>srn", ":setlocal relativenumber!<CR>", {
	desc = "[s]et [r]elative [n]umber",
	silent = true,
})

-- dividir a tela no meio
map("n", "<leader>%", ":vsp<CR>", {
	desc = "slice half screen",
	silent = true,
})

-- No modo de inserção, Ctrl+l age como a seta para a direita
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move cursor right in insert mode" })

-- -----------------------------------------------------------------------------
-- Modo de INSERÇÃO
-- -----------------------------------------------------------------------------

-- Deixar a palavra atual maiúscula
-- Desativei por estar sobscrevendo o comando de identar para trás
-- map("i", "<C-U>", "<esc>viwUea", { desc = "Uppercase word in focus" })

-- Deixar palavra em **negrito** em markdown
map("i", "<C-b>", "<esc>viw<esc>a**<esc>Bi**<esc>Ea", { desc = "Bold word in focus" })

-- Deixar palavra em *italico* em markdown
-- map("i", "<C-i>", "<esc>viw<esc>a*<esc>Bi*<esc>Ea", { desc = "Italic word in focus" })

-- Deixar palavra em code block do markdown
map("i", "<C-c>", "<esc>viw<esc>a`<esc>bi`<esc>lela", { desc = "Code block word in focus" })

-- Sair do modo de inserção
map("i", "jk", "<esc>", { desc = "Exit from insert mood" })

-- -----------------------------------------------------------------------------
-- Modo VISUAL
-- -----------------------------------------------------------------------------

-- gv re-seleciona a última seleção visual
vim.api.nvim_set_keymap("v", "<leader>s", [[:w! /mnt/meuHDExterno/projects/creation-anki-cards-auto/anotacoes.txt]], {
	noremap = true,
	silent = true,
	desc = "Sobescrever arquivo com seleção",
})

-- deixa a seleção em negrito em markdown
map("x", "<C-b>", "c**<esc>pa**", { desc = "Deixar seleção em negrito" })

-- deixa a seleção em itálico em markdown
map("x", "<C-i>", "c*<esc>pa*", { desc = "Deixar seleção em negrito" })

-- "deixa a seleção com aspas duplas
map("x", '<leader>"', 'c"<esc>pa"', { desc = "Deixar seleção com aspas duplas" })

-- deixa a seleção em code block
map("x", "<leader>`", "c`<esc>pa`", { desc = "Deixar seleção em code block" })

-- deixa a seleção em maiúscula
map("x", "<leader>u", "Ugv<esc>", { desc = "deixar seleção em maiúscula" })

-- Copia a seleção
map("x", "<leader>y", '"+y')
