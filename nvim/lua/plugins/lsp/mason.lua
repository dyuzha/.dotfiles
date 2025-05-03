return {
  "williamboman/mason.nvim",
  dependencies = {
    -- Связующе звено между mason и nvim-lsp
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason and mason-lspconfig
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
    -- Enable mason configure icons
      ui = {
        -- Проверять автоматически наличие обновлений?
        check_outdated_packages_on_open = true,
        -- Рамка для окна
        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        width = 0.8, -- Ширина окна
        height = 0.8, -- Высота окна
        icons = {
          package_installed = "✓", -- Пакет установлен
          package_pending = "➜", -- Пакет устанавливается или ожидает установку
          package_uninstalled = "✗", -- Пакет удален или не установлен
        },
      },
      -- Base options
      max_concurrent_installers = 4, -- Параллельная установка
      pip = {
        upgrade_pip = true, -- Обновлять pip при установке Python-серверов
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "cssls",
        "lua_ls",
        -- "emmet_ls",
        -- "prismals",
        "pyright",
        "bashls"
      },
      -- auto-install congigured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
      -- handlers = nil,
    })
  end,
}
--       -- Настройка сочетаний клавиш (представлены стандартные значения с переводом)
--       keymaps = {
--         toggle_package_expand = "<CR>",      -- Раскрыть пакет
--         install_package = "i",               -- Установить пакет, на котором находится курсор
--         update_package = "u",                -- Переустановить/обновить пакет, на котором находится курсор
--         check_package_version = "c",         -- Проверить наличие новой версии для пакета, на котором находится курсор
--         update_all_packages = "U",           -- Обновить все установленные пакеты
--         check_outdated_packages = "C",       -- Проверить наличие новой версии для всех установленных пакетов
--         uninstall_package = "X",             -- Удалить пакет, на котором находится курсор
--         cancel_installation = "<C-c>",       -- Отменить установку пакета, на котором находится курсор
--         apply_language_filter = "<C-f>",     -- Применить языковую фильтрацию
--         toggle_package_install_log = "<CR>", -- Открыть/Закрыть журнал установки пакета, на котором находится курсор
--         toggle_help = "g?",                  -- Открыть меню помощи
--       },
--     },
--   },
--
--   -- {
--   --     "williamboman/mason-lspconfig.nvim",
--   --     opts = {
--   --         -- Список языковых серверов для автоматической установки, если они ещё не установлены. Можно указывать конкретную версию, например, pyright@1.1.339
--   --         ensure_installed = { "pyright", "lua_ls"},
--   --         automatic_installation = true, -- Автоматическая установка
--   --         handlers = nil,
--   --     },
--   -- },
-- }
