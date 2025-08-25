local api_ds = require('env').api.deepseek

local config = {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      -- copilot = false,  -- Явно отключаем Copilot
      openai = {
        api_key = api_ds,
        base_url = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
      },
    }
  }
}

return config
