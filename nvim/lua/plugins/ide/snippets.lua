return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    config = function()
      -- Загружаем friendly-snippets, но исключаем некоторые
      require("luasnip.loaders.from_vscode").lazy_load({
        -- exclude = { "javascript", "typescript" }
      })
    end,
  },

    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI"
    },

    keys = function()
      local ls = require("luasnip")  -- ← Сокращение здесь!
      return {
        {
          "<tab>",
          function()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<tab>", true, true, true), "n", false)
            end
          end,
          mode = { "i", "s" },
          expr = true,
        },
        {
          "<s-tab>",
          function()
            if ls.jumpable(-1) then
              ls.jump(-1)
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<s-tab>", true, true, true), "n", false)
            end
          end,
          mode = { "i", "s" },
          expr = true,
        },
        {
          "<c-e>",
          function()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end,
          mode = { "i", "s" },
        },
      }
    end,



    config = function(_, opts)
        require("luasnip").setup(opts)

        -- Загружаем кастомные сниппеты после friendly-snippets
        require("luasnip.loaders.from_lua").load({
            paths = "~/.dotfiles/nvim/lua/snippets/"
        })
    end
}

