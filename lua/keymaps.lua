local map = vim.keymap.set

-- Por padrão a função map já vem com o parametro
-- não recursivo true, como: noremap = true

-- =============================================================================
-- MAPEAMENTOS GERAIS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Formatações (Modo NORMAL)
-- -----------------------------------------------------------------------------

-- Abrir linha abaixo sem entrar no modo de inserção
map("n", "no", "o<Esc>", {desc = "Open line below"})

-- Abrir linha abaixo sem entrar no modo de inserção
map("n", "nO", "O<Esc>", {desc = "Open line above"})

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
map("n", "<leader>w", ":w<CR>", { desc = "Save buffer"})

-- Salvar todos os buffers e sair
map("n", "<leader>W", ":wa<CR>", { desc = "Save all buffers"})

-- Forçar saída de todos os buffers
map("n", "<leader>q", ":q<CR>", { desc = "[q]uit"})

-- Forçar saída de todos os buffers
map("n", "<leader>Q", ":qa!<CR>", { desc = "[Q]uit [A]ll (forçar saída)"})

-- Criar novo arquivo
map("n", "t", ":enew<CR>", { desc = "Create new buffer"})

-- Nome do arquivo
map('n', '<leader>yp', function()
  vim.fn.setreg('+', vim.fn.expand("%"))
  print('Caminho completo copiado: ' .. vim.fn.expand('%:p'))
end, { desc = '[y]ank [p]ath do arquivo' })

-- Nome do diretório
vim.keymap.set('n', '<leader>yf', function()
  vim.fn.setreg('+', vim.fn.expand('%:t'))
  print('Nome do arquivo copiado: ' .. vim.fn.expand('%:t'))
end, { desc = '[y]ank [f]ilename do arquivo' })

-- Setar o relative number num buffer
map("n", "<leader>srn", ":setlocal relativenumber!<CR>", {
  desc = "[s]et [r]elative [n]umber",
  silent = true
})

-- -----------------------------------------------------------------------------
-- Modo de INSERÇÃO
-- -----------------------------------------------------------------------------

-- Deixar a palavra atual maiúscula
map("i", "<C-u>", "<esc>viwUea", { desc = "Uppercase word in focus" })

-- Sair do modo de inserção
map("i", "jk", "<esc>", { desc = "Exit from insert mood" })

-- pois funciona corretamente mesmo que o cursor esteja no meio da palavra.
-- A sua versão original também é funcional.
