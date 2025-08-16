return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local on_attach = function(client, bufnr)
      local keymap = vim.keymap.set
      local opts = { noremap = true, silent = true, buffer = bufnr }

      -- Привязки клавиш
      keymap("n", "<leader>lf", function() vim.lsp.buf.format() end,
        vim.tbl_extend('force', opts, { desc = "Format Document" }))
      keymap("n", "<leader>lr", function() vim.lsp.buf.rename() end,
        vim.tbl_extend('force', opts, { desc = "Rename Symbol" }))
      keymap("n", "gd", function() vim.lsp.buf.definition() end,
        vim.tbl_extend('force', opts, { desc = "Go to Definition" }))
      keymap("n", "K", function() vim.lsp.buf.hover() end,
        vim.tbl_extend('force', opts, { desc = "Hover" }))
      keymap("n", "gr", function() vim.lsp.buf.references() end,
        vim.tbl_extend('force', opts, { desc = "References" }))
      keymap("n", "gi", function() vim.lsp.buf.implementation() end,
        vim.tbl_extend('force', opts, { desc = "Implementation" }))
      keymap("n", "C-k", function() vim.lsp.buf.signature_help() end,
        vim.tbl_extend('force', opts, { desc = "Signature help" }))
      keymap("n", "<leader>ld", function() vim.diagnostic.open_float() end,
        vim.tbl_extend('force', opts, { desc = "Diagnostics show" }))
      keymap("n", "[d", function() vim.diagnostic.get_prev() end,
        vim.tbl_extend('force', opts, { desc = "Prev error" }))
      keymap("n", "]d", function() vim.diagnostic.get_next() end,
        vim.tbl_extend('force', opts, { desc = "Next error" }))
      keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end,
        vim.tbl_extend('force', opts, { desc = "Next error" }))
      keymap("n", "<leader>ls", function() vim.lsp.buf.document_symbol() end,
        vim.tbl_extend('force', opts, { desc = "Document show" }))
    end

    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = { "pyright", "bashls", "lua_ls", "jsonls" },
      automatic_enable = false,
    })


    -- Language settings
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      }
    })

    lspconfig.jsonls.setup({
      capabilities = capabilities,
      filetypes = { "json", "jsonc" },  -- не добавляем jinja
      on_attach = on_attach,
      settings = {
        json = {
          format = { enable = true },  -- Включить форматирование
          -- schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- lspconfig.docker_language_server.setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach
    -- })

    lspconfig.ansiblels.setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig.bashls.setup({
      capabilities = capabilities,
      on_attach = on_attach
    })
  end
}
