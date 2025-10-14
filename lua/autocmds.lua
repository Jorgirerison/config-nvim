-- Grupo para organizar nossos autocmds
local my_autocmds = vim.api.nvim_create_augroup("MyAutocmds", { clear = true })
-- clear = true é para evitar que os comandos sejam duplicados

-- LSP FORMAT automático
vim.api.nvim_create_autocmd("BufWritePre", { -- antes de um buff ser salvo  group = my_autocmd   -- associamos ao nosso grupo  -- pattern = { "*.lua", "*.py" }, -- arquivos com essa feature  pattern = { "*.py"    -- arquivos com essa feature  callback = function   -- função lu    vim.lsp.buf.format({ async = fals     -- comando p/ formatar o buffr
  en,
  desc = "Formatar arquivos ao salvar",
})
