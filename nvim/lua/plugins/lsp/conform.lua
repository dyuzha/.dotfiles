return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        yaml = { "yamlfmt" }, -- или "yamlfmt"
        json = { "prettier" },
        html = { "prettier" },
        dockerfile = { "yamlfmt" },
        helm = { "yamlfmt" },
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    })

    -- ручной формат (опционально)
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      require("conform").format({ async = true })
    end, { desc = "Format file" })
  end,
}
