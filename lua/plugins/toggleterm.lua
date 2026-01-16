return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup()
			-- keymaps
			local keymap = vim.keymap.set
			keymap("n", "<leader>tt", "<Cmd>ToggleTerm<CR>", { desc = "[T]oggle[T]erm" })

			-- =======================================================
			-- == NOVOS MAPEAMENTOS PARA TERMINAIS VERTICAIS ==
			-- =======================================================
			-- Mapeamento para o terminal #2, forçado a ser vertical
			keymap("n", "<leader>tv1", "<Cmd>2ToggleTerm direction=horizontal<CR>", { desc = "[T]oggle [V]ertical 1" })
			-- Mapeamento para o terminal #3, forçado a ser vertical
			keymap("n", "<leader>tv2", "<Cmd>3ToggleTerm direction=horizontal<CR>", { desc = "[T]oggle [V]ertical 2" })
			-- Você pode adicionar <leader>tv3 para :4ToggleTerm, etc.
			-- =======================================================

			keymap("t", "<C-w>", [[<C-\><C-n><C-w>]], { desc = "ToggleTerm: Navegar entre janelas" })
			keymap("t", "<esc>", [[<C-\><C-n>]], { desc = "ToggleTerm: Ir para o modo de vizualização do terminal" })
			keymap("t", "jk", [[<C-\><C-n>]], { desc = "ToggleTerm: Ir para o modo de vizualização do terminal" })
			-- keymap("n", "<leader>r", [[<cmd>TermExec cmd="python -m src.main" dir=%:h<CR>]], {
			-- 	noremap = true, -- Já é o padrão, mas é bom ser explícito
			-- 	silent = true, -- Não mostra o comando na linha de comando
			-- 	desc = "Executar main.py e voltar ao modo Normal",
			-- })
			-- keymap("n", "<leader>r", function()
			-- 	-- 1. Pega o caminho do arquivo atual
			-- 	local current_file = vim.fn.expand("%")
			--
			-- 	-- 2. Monta o comando dinamicamente
			-- 	-- Usamos aspas simples fora e duplas dentro para evitar conflitos
			-- 	local command_string = 'TermExec cmd="python ' .. current_file .. '"'
			--
			-- 	-- 3. Executa
			-- 	vim.cmd(command_string)
			-- end, { noremap = true, silent = true, desc = "Executar arquivo atual no ToggleTerm" })
		end,
	},
}
