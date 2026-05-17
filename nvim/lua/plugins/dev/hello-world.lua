-- init.lua
return {

  {
    "hello-world",
    -- dir = "/Users/dyuzha/.dotfiles/nvim/lua/dev/hello-world",
    dir = "/Users/dyuzha/Projects/Lua/hello-world",

    dev = true,
    cmd = "SayHello",					-- лениво загружаем при вызове команды
    event = "BufRead *.lua",	-- или при открытии буфера
    -- dependencies = {},			-- массив зависимых плагинов
    -- version = "*",					-- тег, ветка или коммит

    config = function()
      local ls = require("hello-world")

      ls.setup({
        greeting = "Hello world!"
      })

      -- создаём команду для ленивого вызова
      vim.api.nvim_create_user_command("SayHello", function()
        ls.say_hello()
      end, {})
    end,

  },

}
