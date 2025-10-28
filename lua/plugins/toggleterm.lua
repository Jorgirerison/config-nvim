return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup()
      -- keymaps
      local keymap = vim.keymap.set
      keymap("n", "<leader>t", "<Cmd>ToggleTerm<CR>", { desc = "[T]oggle[T]erm" })
      keymap("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "ToggleTerm: Navegar entre janelas" })
      keymap('t', '<esc>', [[<C-\><C-n>]], { desc = "ToggleTerm: Ir para o modo de vizualização do terminal" })
      keymap("t", "jk", [[<C-\><C-n>]], { desc = "ToggleTerm: Ir para o modo de vizualização do terminal" })
      keymap("n", "<leader>r", [[<cmd>TermExec cmd="python main.py" dir=%:h<CR>]], {
          noremap = true, -- Já é o padrão, mas é bom ser explícito
          silent = true,  -- Não mostra o comando na linha de comando
          desc = "Executar main.py e voltar ao modo Normal"
      })
    end,
  },
}
