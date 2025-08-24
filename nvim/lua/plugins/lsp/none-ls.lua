return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local none_ls = require("null-ls")
    none_ls.setup({
      sources = {
        -- Диагностика
        none_ls.builtins.diagnostics.eslint,
        none_ls.builtins.diagnostics.htmlhint,
        -- Форматирование
        none_ls.builtins.formatting.prettier,
        none_ls.builtins.formatting.black,
        -- Code actions
        none_ls.builtins.code_actions.gitsigns,
      },
    })
  end,
}
