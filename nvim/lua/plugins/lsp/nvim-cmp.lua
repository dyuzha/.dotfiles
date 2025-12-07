return {
  "hrsh7th/nvim-cmp",
  lazy = false,
  -- event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "saadparwaiz1/cmp_luasnip",
    -- "rafamadriz/friendly-snippets",
	  -- {"L3MON4D3/LuaSnip",
	  --    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
	  --  },
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    -- loads vscode style snippets from installed plugins (e.g friendly-snippets)
    -- require("luasnip.loaders.from_vscode").lazy_load()
    local kind_icons = {
      Text = " ",
      Method = "󰆧",
      Function = "ƒ ",
      Constructor = " ",
      Field = "󰜢 ",
      Variable = " ",
      Constant = " ",
      Class = " ",
      Interface = "󰜰 ",
      Struct = " ",
      Enum = "了 ",
      EnumMember = " ",
      Module = "",
      Property = " ",
      Unit = " ",
      Value = "󰎠 ",
      Keyword = "󰌆 ",
      Snippet = " ",
      File = " ",
      Folder = " ",
      Color = " ",

    }

    cmp.setup({
      -- preselect = cmp.PreselectMode.None,
      completion = { completeopt = "menu,menuone,preview,noselect" },
      -- keyword_length = 2, -- показывать только после 2 символов

      -- configure how nvim-cmp interacts with snippet engine
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },

      formatting = {
        format = function(entry, vim_item)
        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- Таким образом значки объединяются с названием вида элемента
        vim_item.menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          -- nvim_lua = "[NvimAPI]",
          path = "[Path]",
          })[entry.source.name]
        return vim_item
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
        ['<C-\'>'] = cmp.mapping.complete(),    -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),        -- close completion window
        -- ['<esc>'] = cmp.mapping.abort(),        -- close completion window


        -- ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({ select = false })
          else
            fallback()  -- вставляет обычный Enter / перенос строки
          end
        end, { "i", "s" }),


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
        { name = "luasnip", keyword_length = 2 },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'path', keyword_length = 4 },
        { name = 'buffer', keyword_length = 4 },
        { name = 'nvim_lsp_signature_help', keyword_length = 5 },
        -- { name = 'nvim_lua' },
      },

    })
    -- cmdline mappings (для поиска и команд)
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      }
    })


    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources(
        { { name = 'path' } },
        { { name = 'cmdline' } }
      ),
      -- matching = { disallow_symbol_nonprefix_matching = false, },
    })
  end,
}

