return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- регистрируем кастомный линтер
    lint.linters.kube_linter = {
      name = "kube-linter",
      cmd = "kube-linter",
      stdin = false,
      args = { "lint", "--format", "json" },
      stream = "stdout",
      ignore_exitcode = true,
      parser = require("lint.parser").from_pattern(
        [[(.+):(%d+):(%d+): (.+)]],
        { "file", "lnum", "col", "message" },
        nil,
        {
          source = "kube-linter",
          severity = vim.diagnostic.severity.WARN,
        }
      ),
    }



    lint.linters_by_ft = {
      -- javascript = { "eslint" },
      -- python = { "pylint" },
      json = { "jsonlint" },
      helm = { "kube_linter" },

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
