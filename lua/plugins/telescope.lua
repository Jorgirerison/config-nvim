-- plugins/telescope.lua:
return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      -- Busca na pasta de config do Neovim
      vim.keymap.set('n', '<leader>fc', function()
       builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = 'Buscar arquivos da config do Neovim' })
      -- Busca no HD externo
      vim.keymap.set('n', '<leader>fp', function()
       builtin.find_files()
      end, { desc = 'Buscar na raiz do projeto' })
    end
  },
  -- isso comba com o <leader>ca afim de apresentar
  -- uma caixa com as code actions visualmente mais
  -- bonita em algum subscrito de atenção
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
