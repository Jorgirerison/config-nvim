return {
  { -- require plugins in lua/plugins/treesitter.lua and lua/plugins/lsp.lua
    "quarto-dev/quarto-nvim",
    dev = false,
    opts = {
      lspFeatures = {
        enabled = true,
        chunks = 'curly'
      },
      codeRunner = {
        enabled        = true,
        default_method = 'molten',
      }
    },
    dependencies = {
      -- for languagens features in code cells
      -- configured in lua/plugins/lsp.lua
      "jmbuhr/otter.nvim",
    }
  },
  {
    "GCBallesteros/jupytext.nvim",
    config = function()
      require("jupytext").setup({
        style = "quarto",
        -- output_extension = "md",
        force_ft = "quarto",
        extension = "qmd",
      })
    end,
  },
  -- 	{ "jmbuhr/otter.nvim", ft = { "markdown", "quarto", "norg" } },
  -- 	{
  -- 		"quarto-dev/quarto-nvim",
  -- 		dependencies = {
  -- 			"nvim-treesitter/nvim-treesitter",
  -- 			"neovim/nvim-lspconfig",
  -- 		},
  -- 		ft = { "markdown", "quarto", "norg" },
  -- 		config = function()
  -- 			local quarto = require("quarto")
  -- 			quarto.setup({
  -- 				lspFeatures = {
  -- 					languages = { "python", "rust", "lua" },
  -- 					chunks = "all", -- 'curly' or 'all'
  -- 					diagnostics = {
  -- 						enabled = true,
  -- 						triggers = { "BufWritePost" },
  -- 					},
  -- 					completion = {
  -- 						enabled = true,
  -- 					},
  -- 				},
  -- 				keymap = {
  -- 					hover = "H",
  -- 					definition = "gd",
  -- 					rename = "<leader>rn",
  -- 					references = "gr",
  -- 					format = "<leader>gf",
  -- 				},
  -- 				codeRunner = {
  -- 					enabled = true,
  -- 					ft_runners = {
  -- 						bash = "slime",
  -- 					},
  -- 					default_method = "molten",
  -- 				},
  -- 			})
  --
  -- 			vim.keymap.set(
  -- 				"n",
  -- 				"<localleader>qp",
  -- 				quarto.quartoPreview,
  -- 				{ desc = "Preview the Quarto document", silent = true, noremap = true }
  -- 			)
  --		end,
  --	},
}
