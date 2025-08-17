return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      -- javascript = { "eslint" },
      python = { "pylint" },
      json = { "jsonlint" },
      -- другие языки...
    }
    -- Автозапуск линтинга при сохранении
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
