return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()

    require('nvim-treesitter.configs').setup({
      modules = {},

      -- Список нужных парсеров (первые 7 парсеров обязательно должны быть установлены)
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
        "python", "php", "bash", "html", "jinja", "jinja_inline"
      },

      -- Способ установки парсеров (синхронный или асинхронный)
      sync_install = false, -- Включаем асинхронную установку парсеров

      -- Автоматически устанавливать недостающие парсеры при входе в буфер
      auto_install = true,

      ignore_install = {},

      highlight = {
          enable = true, -- Активировать подсветку
          -- disable = { "jinja", "jinja2", "j2" },  -- Отключаем Treesitter для Jinja
      },
      -- Установите значение true или впишите список ЯП, в которых вы зависите от включения синтаксиса (например, для отступов)
      -- additional_vim_regex_highlighting = true,
      additional_vim_regex_highlighting = { "jinja" },
    })


    -- Поддержка файлов вида *.json.jinja
    vim.filetype.add({
      pattern = {
        [".*%.json%.jinja"] = "jinja", -- основной ft
      },
    })
  end,
}
