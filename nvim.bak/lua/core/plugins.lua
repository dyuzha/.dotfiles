-- Установка менеджера расширений и его подключение

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Если нет информации про lazypath
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  -- Выполняет клонирование репозитория
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  -- Если произошла ошибка
  if vim.v.shell_error ~= 0 then
    -- Выводиться ошибка
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    -- Программа завершается с ошибкой
    os.exit(1)
  end
end

-- Добавление lazypath в начало rdp (runtime path - определяет пути для поиска плагинов)
vim.opt.rtp:prepend(lazypath)

-- Настройка параметров менеджера плагинов (Lazy.nvim)
require("lazy").setup({
  -- Импорт всех файлов из указанных каталогов
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" },
    { import = "plugins.ide" },
    { import = "plugins.obs" },
  },

  -- Настройка поведения плагинов "по умолчанию"
  defaults = {
    lazy = false, -- Не загружать расширения автоматически, только при их явном вызове или же по преднастроенному событию
  },
  performance = {
    cache = {
      enabled = true, -- Включение кэширования (должно обеспечивать более быстрый запуск nvim)
    },

    reset_packpath = true, -- Сбросить путь к пакету, чтобы ускорить запуск

    rtp = {
      reset = true, -- Сбросить путь выполнения к $VIMRUNTIME и каталогу конфигурации
      paths = {},   -- Добавьте сюда любые пользовательские пути, которые вы хотите включить в rtp
      -- Список плагинов для отключения
      disabled_plugins = {
      },
    },
  },

  -- Настройка внешней составляющей окна Lazy.nvim
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",

    size = { width = 0.8, height = 0.8 },
  },

  -- Определение иконок для различных типов данных
  icons = {
    cmd = " ",
    config = "",
    event = "",
    ft = " ",
    init = " ",
    import = " ",
    keys = " ",
    lazy = "󰂠 ",
    loaded = "●",
    not_loaded = "○",
    plugin = " ",
    runtime = " ",
    source = " ",
    start = "",
    task = "✔ ",
    list = {
      "●",
      "➜",
      "★",
      "‒",
    },
  },

  checker = {
    enabled = true, -- Автоматическая проверка на наличие обновлений для плагинов
    notify = false, -- Получать уведомления о появлении новых обновлений
  },

  change_detection = {
    enabled = false, -- Автоматически проверять наличие изменений в конфигурационном файле и перезагружать UI (пользовательский интерфейс)
    notify = false,  -- Получать уведомление при обнаружении изменений
  },

  install = {
    colorscheme = { "catppuccin" }, -- Цветовая схема, которая будет использоваться при установке плагинов (по возможности)
    missing = true,                 -- Установить недостающие плагины при запуске? (Это не увеличивает время запуска)
  },
})
