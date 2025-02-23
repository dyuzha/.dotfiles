vim.fn.sign_define("DiagnosticSignError", { text = "󰅙 ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",       -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
      enable_diagnostics = true,
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },

      file_size = {
        enabled = true,
        required_width = 64,         -- Минимальная ширина окна
      },

      type = {
        enabled = true,
        required_width = 122,
      },

      last_modified = {
        enabled = true,
        required_width = 88,
      },

      created = {
        enabled = true,
        required_width = 110,
      },

      symlink_target = {
        enabled = true,
      },

      window = {
        position = "center",
        width = 50,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["l"] = "open", -- Открыть/Закрыть файл или директорию
          ["д"] = "open", -- Открыть/Закрыть файл или директорию

          -- Предварительный просмотр файлов (для плавающего режима)
          [" "] = { "toggle_preview", config = { use_float = true, use_image_nvim = false } }, -- в новом соседнем окне

          ["a"] = "add", -- Создать файл (если добавить "/", то создастся директория)
          ["ф"] = "add", -- Создать файл (если добавить "/", то создастся директория)

          ["A"] = "add_directory",
          ["Ф"] = "add_directory",

          ["d"] = "delete",
          ["в"] = "delete",

          ["r"] = "rename",
          ["к"] = "rename",

          ["y"] = "copy_to_clipboard",           -- Скопировать файл/директорию в буфер обмена
          ["н"] = "copy_to_clipboard",

          ["x"] = "cut_to_clipboard",           -- Вырезать файл/директорию в буфер обмена
          ["ч"] = "cut_to_clipboard",

          ["p"] = "paste_from_clipboard",           -- Вставить файл/директорию из буфера обмена в нужное место
          ["з"] = "paste_from_clipboard",

          ["c"] = "copy",           -- Скопировать файл/директорию (можно указать путь для перемещения вручную)
          ["с"] = "copy",

          ["m"] = "move",           -- Переместить файл/директорию
          ["ь"] = "move",

          ["q"] = "close_window",           -- Закрыть все окна neotree
          ["й"] = "close_window",

          ["i"] = "show_file_details",           -- Отобразить доп. информацию о файле/директории
          ["ш"] = "show_file_details",

          ["?"] = "show_help",            -- Открыть меню справки neotree
          ["<esc>"] = "cancel",           -- Клавиша закрытия различных окон neotree
        },
      },

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        window = {
          mappings = {
            ["H"] = "toggle_hidden", -- Переключатель для отображения скрытых файлов (для корректной работы измените значения параметров в filtered_items)
            ["Р"] = "toggle_hidden", -- Переключатель для отображения скрытых файлов (для корректной работы измените значения параметров в filtered_items)

            -- Отображать только содержимое выбранной директории (для выхода из данного режима нужно нажать backspace)
            ["."] = "set_root",
          },
        },
      },
    },
  },
}
