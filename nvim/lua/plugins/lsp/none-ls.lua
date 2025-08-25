return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    -- Кастомный htmlhint (так как в null-ls нет встроенного)
    local htmlhint = {
      method = null_ls.methods.DIAGNOSTICS,
      filetypes = { "html" },
      generator = null_ls.generator({
        command = "htmlhint",
        args = { "--format", "unix", "$FILENAME" },
        to_stdin = false,
        from_stderr = false,
        format = "line",
        check_exit_code = function(code)
          return code == 0 or code == 1
        end,
        on_output = function(line, params)
          -- формат unix: file:line:col: message [rule]
          local row, col, msg = line:match(":(%d+):(%d+):%s+(.+)")
          if row and col and msg then
            return {
              row = tonumber(row),
              col = tonumber(col),
              message = msg,
              severity = 2, -- WARN
              source = "htmlhint",
            }
          end
        end,
      }),
    }

    null_ls.setup({
      sources = {
        htmlhint,


        -- HTML linter (пример, его не существует)
        -- null_ls.builtins.diagnostics.htmlhint.with({
        --   command = "htmlhint", -- Mason ставит бинарь в PATH
        --   filetypes = { "html" },
        -- }),

        -- (по желанию ещё форматтеры / другие линтеры)
        -- null_ls.builtins.formatting.prettier,
      },
    })
  end,
}
