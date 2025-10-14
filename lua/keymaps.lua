local map = vim.keymap.set

-- Por padrão a função map já vem com o parametro
-- não recursivo true, como: noremap = true

-- =============================================================================
-- MAPEAMENTOS GERAIS
-- =============================================================================

-- -----------------------------------------------------------------------------
-- Interações com o buffer (Modo NORMAL)
-- -----------------------------------------------------------------------------

-- Salvar buffer
map("n", "<C-s>", ":w<CR>", { desc = "Write buffer" })

-- Selecionar todo o buffer 
map("n", "<C-a>", "ggVG", { desc = "Select all content" })

-- Fechar o buffer (aba)
map("n", "<leader>q", "<cmd>bdelete<CR>", { desc = "Buffer delete" })

-- Salvar buffer atual e sair
map("n", "<leader>w", ":wq<CR>", { desc = "Save buffer and quit"})

-- Salvar todos os buffers e sair
map("n", "<leader>W", ":wqa<CR>", { desc = "Save all buffers and quit"})

-- Forçar saída de todos os buffers
map("n", "<leader>Q", ":qa!<CR>", { desc = "[Q]uit [A]ll (forçar saída)"})

-- Criar novo arquivo
map("n", "<C-t>", ":enew<CR>", { desc = "Create new buffer"})

-- Nome do arquivo
map('n', '<leader>yp', function()
  vim.fn.setreg('+', vim.fn.expand('%:p'))
  print('Caminho completo copiado: ' .. vim.fn.expand('%:p'))
end, { desc = '[Y]ank [P]ath do arquivo' })

-- Nome do diretório
vim.keymap.set('n', '<leader>yf', function()
  vim.fn.setreg('+', vim.fn.expand('%:t'))
  print('Nome do arquivo copiado: ' .. vim.fn.expand('%:t'))
end, { desc = '[Y]ank [F]ilename do arquivo' })

-- -----------------------------------------------------------------------------
-- Modo de INSERÇÃO
-- -----------------------------------------------------------------------------

-- Deixar a palavra atual maiúscula
map("i", "<C-u>", "<esc>viwUea", { desc = "Uppercase word in focus" })

-- Sair do modo de inserção
map("i", "jk", "<esc>", { desc = "Exit from insert mood" })

-- pois funciona corretamente mesmo que o cursor esteja no meio da palavra.
-- A sua versão original também é funcional.
