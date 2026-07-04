return {
  "stevearc/conform.nvim",
  event = { "VeryLazy" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        json = { "prettier" },
        html = { "prettier" },
        dockerfile = { "prettier" },
        -- helm = { "prettier" },
        python = { "ruff_format", "isort" },
        vue = { "prettier" },

        -- yaml = { "yamlfmt" }, -- или "yamlfmt"
        -- yaml_ansible = { "prettier" },
        -- yaml_ansible = { "yaml_ansible" },

        -- markdown = { "mdformat" },
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    })

    -- -- ручной формат (опционально)
    vim.keymap.set("n", "<leader>lf", function()
      require("conform").format({ async = true })
    end, { desc = "Format document" })
  end,
}
