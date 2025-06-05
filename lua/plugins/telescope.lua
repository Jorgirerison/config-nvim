-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    -- Busca na pasta de config do Neovim
    vim.keymap.set('n', '<leader>fc', function()
     builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = 'Buscar arquivos da config do Neovim' })
    -- Busca no HD externo
    vim.keymap.set('n', '<leader>fp', function()
     builtin.find_files({ cwd = "/mnt/wwn-0x50014ee65dfab64d-part3/projects" })
    end, { desc = 'Buscar projetos no HD externo' })
  end
}
