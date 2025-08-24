return {
    "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          border = "rounded", -- Use rounded borders for the Mason window
          icons = {
              package_installed = "✅",
              package_pending = "⏳",
              package_uninstalled = "❌"
          }
        },
      }
    },
    "neovim/nvim-lspconfig",
  },

  config = function()

    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
        vim.tbl_extend('force', opts, { desc = "Code Action" }))
      keymap("n", "<leader>ls", function() vim.lsp.buf.document_symbol() end,
        vim.tbl_extend('force', opts, { desc = "Document show" }))
    end


    require("mason").setup()


    local default_config = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    mason_lspconfig.setup({
      ensure_installed = {
        "pyright", "bashls", "lua_ls", "jsonls", "ts_ls", "biome", "cssls", "html",
    },
      automatic_enable = true,
    })


    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostic = {globals = {"vim"} },
        }
      }
    })

    vim.lsp.config("jsonjs", {
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

    vim.lsp.config("pyright", default_config)
    vim.lsp.config("bashls", default_config)

    -- DevOps
    vim.lsp.config("docker_language_server", default_config)
    vim.lsp.config("ansiblels", default_config)

    -- Web --
    vim.lsp.config("biome", {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    })

    vim.lsp.config("ts_ls",{
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
    })

    vim.lsp.config("html", {
      capabilities = capabilities,
      on_attach = on_attach,

      init_options = {
        -- Явно включите диагностику
        provideValidation = true,
        embeddedLanguages = { css = true, javascript = true }
      },

      settings = {
        html = {
          validate = { enable = true },  -- Включить валидацию
          suggest = { enable = true },   -- Включить подсказки
          format = { enable = true }     -- Включить форматирование
        }
      },
    })

    vim.lsp.config("cssls", {
      capabilities = capabilities,
      on_attach = on_attach
    })


  end
}
