return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
          icons = { package_pending = "⏳" }
        },
      }
    },
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason").setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "jsonls",
        "pyright",
        "bashls",
        "dockerls",
        "ansiblels",
        "systemd_lsp",
        "vtsls",
        "vue_ls",
      },
    })

    -- 🔧 on_attach
    local on_attach = function(_, bufnr)
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

    local default_config = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- 🔥 список серверов
    local servers = {
      "cssls",
      "html",
      "jsonls",
      "pyright",
      "bashls",
      "dockerls",
      "ansiblels",
      "systemd_lsp",
    }

    -- ✅ новый API
    for _, server in ipairs(servers) do
      vim.lsp.config(server, default_config)
      vim.lsp.enable(server)
    end

    -- 🔥 VTSLS (Vue + TS)
    local vue_language_server_path =
      vim.fn.stdpath("data") ..
      "/mason/packages/vue-language-server/node_modules/@vue/language-server"

    vim.lsp.config("vtsls", {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        if vim.bo.filetype == "vue" then
          client.server_capabilities.semanticTokensProvider.full = false
        end
        on_attach(client, bufnr)
      end,
      filetypes = {
        "typescript",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "vue",
      },
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
              },
            },
          },
        },
      },
    })

    vim.lsp.enable("vtsls")

    -- 🔥 Vue LS (ВАЖНО: теперь это просто имя конфига)
    vim.lsp.config("vue_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        vue = {
          inlayHints = {
            missingProps = { enabled = true },
          },
        },
      },
    })

    -- vim.lsp.enable("vue_ls")

    -- 🔥 Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.enable("lua_ls")

    -- diagnostics
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
    })
  end
}
