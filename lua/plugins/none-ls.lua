return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.formatting.rubocop,
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.diagnostics.mypy,
          require("none-ls.diagnostics.eslint"), -- <- substituição correta aqui
          require("none-ls.diagnostics.flake8"), -- <- substituição correta aqui
        },
      })

      -- Grupo de comandos para LSP (Language Server Protocol)
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "[L]SP [F]ormat" })
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "[L]SP [R]ename" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })                  -- Usar 'K' é o padrão do Vim para isso
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]o to [D]efinition" }) -- 'gd' é um padrão forte na comunidade, bom manter

      -- Grupo de comandos para Diagnostics
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "[D]iagnostic [P]revious" })
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "[D]iagnostic [N]ext" })
      vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "[D]iagnostic [E]rror details" })
      vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "[D]iagnostic [L]ist" })
    end,
  },
}
