vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.number = true
vim.opt.termguicolors = true
vim.diagnostic.config({
  virtual_text = true, -- mostra o erro em linha
  signs = true,       -- mostra ícones na lateral
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
  },
})
vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set("n", "qq", 'i<Right>""<Left>', { noremap = true })
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
