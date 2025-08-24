local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Простой текстовый сниппет
ls.add_snippets("all", {
  s("hello", {
    t("Hello, world!")
  })
})

-- Сниппет с вставками
ls.add_snippets("javascript", {
  s("cl", {
    t("console.log("),
    i(1, "variable"),
    t(");")
  })
})

-- Более сложный сниппет с форматированием
ls.add_snippets("python", {
  s("def", fmt([[
    def {}({}):
        {}"""{}"""
        {}
  ]], {
    i(1, "function_name"),
    i(2, "params"),
    i(3, ""),
    i(4, "docstring"),
    i(5, "pass")
  }))
})
