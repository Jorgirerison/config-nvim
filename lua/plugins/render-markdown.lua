return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "quarto"}, -- Carrega para arquivos markdown
    config = function()
      -- Procure no README do plugin pelas opções exatas de setup
      require("render-markdown").setup({
        render_modes = { "n", "c", "t" },
        enabled = true,
        anti_conceal = { enabled = false },
        -- window = {
        --   conceal_level = 2,
        -- },
        code_blocks = {
          enable = true,
          highlight = "treesitter", -- ou 'vim'
        }
      })
      print("render-markdown.nvim carregado e configurado!") -- Linha de teste
    end,
  },
}
