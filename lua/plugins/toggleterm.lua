return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
      vim.keymap.set("n", "<leader>t", "<Cmd>ToggleTerm<CR>", { desc = "[T]oggle[T]erm" })
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "ToggleTerm: Navegar entre janelas" })
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], { desc = "ToggleTerm: Ir para o modo de vizualização do terminal" })
    end,
  },
}
