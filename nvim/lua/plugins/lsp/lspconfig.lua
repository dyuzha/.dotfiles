return {
    "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          border = "rounded", -- Use rounded borders for the Mason window
          icons = { package_pending = "⏳", }
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

    -- функция для конкатенации массивов
    local function join_arrays(a, b)
      local result = {}
      for _, v in ipairs(a) do
        table.insert(result, v)
      end
      for _, v in ipairs(b) do
        table.insert(result, v)
      end
      return result
    end


    local custom_lsp_servers = {
      "lua_ls",
      "ts_ls",
      "biome",
    }

    local default_lsp_servers = {
      "cssls",
      "html",
      "jsonls",
      "pyright",
      "bashls",
      "dockerls",
      "ansiblels",
    }

    local lsp_servers = join_arrays(custom_lsp_servers, default_lsp_servers)

    -- Автоматически устанавливаем все сервера
    mason_lspconfig.setup({
      ensure_installed = lsp_servers,
    -- Включаем автонастройку для всех серверов установленных через Mason,
    -- кроме тех, что настраиваются здесь (явно)
      automatic_enable = {
        exclude = lsp_servers,
      },
    })

    --  === === === === === ===  --
    -- === Настройка серверов === --
    --  === === === === === ===  --

    -- Настройка default серверов
    for _, server in ipairs(default_lsp_servers) do
      lspconfig[server].setup(default_config)
    end

    -- Кастомная настрока серверов
    lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", default_config, {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    }))

    -- vim.lsp.config("jsonls", {
    --   capabilities = capabilities,
    --   filetypes = { "json", "jsonc" },  -- не добавляем jinja
    --   on_attach = on_attach,
    --   settings = {
    --     json = {
    --       format = { enable = true },  -- Включить форматирование
    --       -- schemas = require("schemastore").json.schemas(),
    --       validate = { enable = true },
    --     },
    --   },
    -- })

    lspconfig.ts_ls.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
      single_file_support = true,
    }))

    lspconfig.biome.setup(vim.tbl_deep_extend("force", default_config, {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    }))

  end
}
