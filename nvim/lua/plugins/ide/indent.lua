return {{
    "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",          -- Символ для отображения отступа (можно заменить на "▏", "┆" и т.д.)
      tab_char = "│",       -- Символ для табуляции
    },

    whitespace = {
      highlight = { "Whitespace" },   -- Подсветка пробелов
    },
    scope = {
      show_start = true,    -- Показывать начало области (например, начала блока кода)
      show_end = true,      -- Показывать конец области
      char = "▏",           -- Символ для области
      enabled = false,                 -- Включить подсветку областей (блоков кода)
      show_exact_scope = false,        -- Показывать точные границы областей
      -- highlight = { "Function" },     -- Группа подсветки для областей
    },
    exclude = {
      filetypes = {         -- Исключить определённые типы файлов
        "markdown",
        "help",
        "dashboard",
        "lazy",
        "mason",
        "notify",
      },
    },
  },
}}
