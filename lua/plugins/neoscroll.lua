return {
  "karb94/neoscroll.nvim",
  config = function()
    local neoscroll = require("neoscroll")

    -- Mapeamentos para neoscroll
    local keymap = {
      -- Rolagem de página inteira:
      ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 350 }) end, -- 450 default
      ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 350 }) end, -- 450 default

      -- Rolagem de meia página:
      ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 250 }) end, -- 250 default
      ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 250 }) end, -- 250 default

      -- Rolagem de poucas linhas:
      ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 50 }) end,
      ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 50 }) end,

      -- Centralizar cursor na tela:
      ["zt"] = function() neoscroll.zt({ half_win_duration = 150 }) end, -- 250 half_w
      ["zz"] = function() neoscroll.zz({ half_win_duration = 150 }) end, -- 250 half_w
      ["zb"] = function() neoscroll.zb({ half_win_duration = 150 }) end, -- 250 half_w
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end,
}
