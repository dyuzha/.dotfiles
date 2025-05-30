return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {

        ----------------------------------------
        -- Options -----------------------------
        ----------------------------------------

      options = {
        icons_enabled = true, -- Поддержка иконок
        theme = 'auto', -- Тема для Lualine

        component_separators = { left = '', right = '|' },
        section_separators = { left = '', right = '' },

        -- Типы файлов, для которых не будет отображаться панель <lualine>
        disabled_filetypes = {
          -- statusline = {'neo-tree','dashboard'},
          winbar = {},
        },

        ignore_focus = {},
        always_divide_middle = true, -- Сохранить фиксированное пространство между двумя частями <lualine> (всегда разделять середину)
        globalstatus = true, -- Должен ли <lualine> быть общим для всех окон

        -- Интервал обновления данных в <lualine> в миллисекундах
        refresh = {
          -- 1000 миллисекунд = 1 секунда
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },

      -----------------------------------------
      --| A | B | C   StatusLine  X | Y | Z |--
      -----------------------------------------

      -- Активное окно
      sections = {
        -- Настройка компонентов слева
        lualine_a = { { 'mode', separator = { left = ''}, right_padding = 2 } },
        lualine_b = { 'branch', 'diff'},
        lualine_c = {
            {'filename', path = 0},
            -- 0: Только имя файла
            -- 1: Относительный путь
            -- 2: Абсолютный путь
            -- 3: Абсолютный путь с тильдой вместо домашнего каталога
            -- 4: Имя файла и родительский каталог с тильдой вместо домашнего каталога
          {'diagnostics',
            sources = { 'nvim_diagnostic', 'nvim_lsp' }, -- Источники для диагностики
            sections = { 'error', 'warn', 'info', 'hint' }, -- Отображаемые типы информации
            diagnostics_color = {
              -- Определение расцветки для различных типов диагностической информации
              error = 'DiagnosticError',
              warn = 'DiagnosticWarn',
              info = 'DiagnosticInfo',
              hint = 'DiagnosticHint',
            },
            -- symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' }, -- символы для обозначения типов информации
            symbols = { error = '󰅙 ', warn = ' ', info = '', hint = ' ' }, -- символы для обозначения типов информации
            colored = true, -- Использовать установленные расцветки
            update_in_insert = true, -- Обновлять диагностические данные в Insert Mode
            always_visible = false, -- Отображать диагностику даже если нет данных
          }, },
        lualine_x = { 'filetype', 'encoding', 'fileformat' },
        lualine_y = {'progress'},
        lualine_z = { {'location',  separator = { right = '' }, left_padding = 2 } },
    },


      -- Неактивное окно
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{'filename', path = 3}},

        lualine_x = {'filetype', 'encoding', 'fileformat', 'filesize'},
        lualine_y = {},
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
}
--[[
Доступные компоненты:
• branch (Отображает текущую ветку Git)
• buffers (Показывает доступные на данный момент буферы)
• diagnostics (Отображает текущую информацию об ошибках, предупреждениях и так далее в соответствии с выбранным источником диагностической информации)
• diff (Отображает статус изменений файла Git [добавлено, изменено, удалено и т.д.])
• encoding (Отображает кодировку файла)
• fileformat (Отображает текущий формат файла: unix[], dos[], mac[])
• filename (Отображает название файла)
• filesize (Отображает размер файла)
• filetype (Отображает тип файла)
• hostname (Отображает имя хоста, то есть ПК)
• location (Отображает текущее местоположение курсора в файле в формате <строка:столбец>)
• mode (Отображает текущий режим работы Neovim)
• progress (Отображает прогресс в процентах[%] в файле)
• searchcount (Отображает кол-во совпадений для поиска, когда опция hlsearch активирована)
• selectioncount (Отображает количество выбранных[выделенных] символов или строк)
• tabs (Отображает список доступных вкладок)
• windows (Отображает список доступных окон)
• datetime (Отображает текущую дату и время)
--]]
