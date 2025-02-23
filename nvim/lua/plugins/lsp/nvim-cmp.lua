return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",           -- source for text in buffer
    "hrsh7th/cmp-path",             -- source for text in system paths
    "L3MON4D3/LuaSnip",             -- snippet engine
    'saadparwaiz1/cmp_luasnip',     -- for autocompletion
    "rafamadriz/friendly-snippets", --useful snippets (format VSCode)
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    -- loads vscode style snippets from installed plugins (e.g friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- local kind_icons = {
    --   Text = " ",
    --   Method = "󰆧",
    --   Function = "ƒ ",
    --   Constructor = " ",
    --   Field = "󰜢 ",
    --   Variable = " ",
    --   Constant = " ",
    --   Class = " ",
    --   Interface = "󰜰 ",
    --   Struct = " ",
    --   Enum = "了 ",
    --   EnumMember = " ",
    --   Module = "",
    --   Property = " ",
    --   Unit = " ",
    --   Value = "󰎠 ",
    --   Keyword = "󰌆 ",
    --   Snippet = " ",
    --   File = " ",
    --   Folder = " ",
    --   Color = " ",
    -- }

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect"
      },
      -- configure how nvim-cmp interacts with snippet engine
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Настройка параметров окна <cmp>
      window = {
        completion = cmp.config.window.bordered(),    -- Отображение рамки окна подсказок
        documentation = cmp.config.window.bordered(), -- Отображение рамки окна документации к подсказкам
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),        -- close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Перейти к следующей подсказке
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Перейти к предыдущей подсказке
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end, { "i", "s" })
      }),

      -- Sources for autocompletion
      sources = {
        { name = "luasnip" },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        -- { name = 'nvim_lsp_signature_help' },
        -- { name = 'nvim_lua' },
      }
    })
  end,
}
