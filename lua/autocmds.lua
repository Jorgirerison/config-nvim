-- Grupo para organizar nossos autocmds
local my_autocmds = vim.api.nvim_create_augroup("MyAutocmds", { clear = true })
-- clear = true é para evitar que os comandos sejam duplicados

-- LSP FORMAT automático
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.qmd",
  callback = function()
    require("otter").activate({ "python" }, true)
  end,
})

