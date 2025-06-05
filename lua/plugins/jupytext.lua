return {
    "GCBallesteros/jupytext.nvim",
    config = function()
        require("jupytext").setup({
            style = "quarto",
            -- output_extension = "md",
            force_ft = "quarto",
            extension = "qmd",
        })
    end
}
