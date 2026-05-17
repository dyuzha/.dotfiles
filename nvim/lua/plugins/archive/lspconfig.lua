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
    -- local lspconfig = require("lspconfig")
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

    -- функция для слияния массивов
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
      "vtsls",
    }

    local default_lsp_servers = {
      "cssls",
      "html",
      "jsonls",
      "pyright",
      "bashls",
      "dockerls",
      "ansiblels",
      "systemd_lsp",
      "vue_ls",
    }

    local lsp_servers = join_arrays(custom_lsp_servers, default_lsp_servers)

    -- Автоматически устанавливаем все сервера
    mason_lspconfig.setup({
      ensure_installed = lsp_servers,
      automatic_enable = true,
    })

    --  === === === === === ===  --
    -- === Настройка серверов === --
    --  === === === === === ===  --

    -- Настройка default серверов
    for _, server in ipairs(default_lsp_servers) do
      vim.lsp.config[server] = default_config
    end


    -- Кастомная настрока серверов
    vim.lsp.config.lua_ls = vim.tbl_deep_extend("force", default_config, {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    -- vim.lsp.config.vue_ls = vim.tbl_deep_extend("force", default_config, {
    --   filetypes = { "vue" },
    -- })

    vim.lsp.config.vtsls = vim.tbl_deep_extend("force", default_config, {
      -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      filetypes = { 'vue' },
      on_attach = function(client, bufnr)
        if vim.bo.filetype == 'vue' then
          client.server_capabilities.semanticTokensProvider.full = false
        end
        on_attach(client, bufnr)
      end,
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              {
                name = "@vue/typescript-plugin",
                -- location = vue_language_server_path,
                languages = { "vue" },
                configNamespace = "typescript",
                enableForWorkspaceTypeScriptVersions = true,
              },
            },
          },
        },
      },
    })

    vim.lsp.config.vue_ls = vim.tbl_deep_extend("force", default_config, {
      on_init = function(client)
        client.handlers['tsserver/request'] = function(_, result, context)
          local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = 'vtsls' })
          if #clients == 0 then
            vim.notify('Could not find vtsls lsp client, required by vue_ls', vim.log.levels.ERROR)
            return
          end

          local ts_client = clients[1]
          local param = table.unpack(result)
          local id, command, payload = table.unpack(param)

          ts_client:exec_cmd({
            title = 'vue_request_forward',
            command = 'typescript.tsserverRequest',
            arguments = { command, payload },
          }, { bufnr = context.bufnr }, function(_, r)
            local response_data = { { id, r.body } }
            client:notify('tsserver/response', response_data)
          end)
        end
      end,

      filetypes = { "vue" },
      settings = {
        vue = {
          inlayHints = {
            missingProps = { enabled = true },
            optionsWrapper = { enabled = true },
            vBindShorthand = { enabled = true },
          },
        },
      },
    })









    vim.lsp.config.ts_ls = vim.tbl_deep_extend("force", default_config, {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        on_attach(client, bufnr)
      end,
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        -- "vue"
      },
      -- root_dir = vim.fs.dirname.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
      single_file_support = true,
    })

    vim.lsp.config.biome = vim.tbl_deep_extend("force", default_config, {
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        -- "vue"
      },
    })


    -- Настройка dev-серверов
    -- local venv_python = "/Users/dyuzha/.dotfiles/nvim/lua/dev/systemd_units_ls/.venv/bin/python3"
    -- local suls_python = "/Users/dyuzha/.dotfiles/nvim/lua/dev/systemd_units_ls/main.py"
    --
    --
    -- vim.lsp.config.suls = vim.tbl_deep_extend("force", default_config, {
    --   cmd = { venv_python, suls_python },
    --   filetypes = { "service", "timer" },
    --   root_dir = vim.fs.dirname(vim.api.nvim_buf_get_name(0)),
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    -- })
    --
    -- vim.lsp.enable('suls')
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("vue_ls")
  end
}
