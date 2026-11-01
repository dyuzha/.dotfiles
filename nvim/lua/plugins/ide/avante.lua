return {
  "yetone/avante.nvim",

  -- macOS 26 убивает nvim (SIGKILL, Code Signature Invalid) на linker-signed .so
  build = "make && if [ \"$(uname)\" = Darwin ]; then codesign --force --sign - lua/*.so; fi",

  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!

  ---@module 'avante'
  ---@type avante.Config
  opts = {
    instructions_file = "avante.md",

    -- provider = "ollama",
    -- provider = "openrouter",
    provider = "kimi",

    providers = {

      --   openrouter = {
      --     __inherited_from = "openai",
      --     endpoint = "https://openrouter.ai/api/v1",
      --     api_key_name = "OPENROUTER_API_KEY",
      --     -- model = "deepseek/deepseek-v3.2",
      --     -- model = "deepseek/deepseek-r1",
      --     model = "openrouter/free",
      --   }
      -- },
      --

      kimi = {
        __inherited_from = "openai",
        endpoint = "https://api.kimi.ai/coding/v1",
        model = "kimi-k2.7-code-highspeed",
        api_key_name = "KIMI_NVIM_API_KEY",
        extra_request_body = {
          temperature = 1,
          -- max_tokens = 32768,
        },
      },

      -- openrouter = {
      --   endpoint = "https://openrouter.ai/api/v1",
      --   model = "openrouter/free",
      --   api_key_name = "OPENROUTER_API_KEY",
      -- },

      -- gemini = {
      --   --   __inherited_from = "gemini",
      --   --   endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
      --   api_key_name = "GEMINI_API_KEY",
      --   --   model = "gemini-2.0-flash",  -- или "gemini-2.0-pro-exp", "gemini-2.5-pro-preview-03-25"
      -- },

    },
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    { "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },
    --- The below dependencies are optional,
    "nvim-mini/mini.pick",           -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "stevearc/dressing.nvim",        -- for input provider dressing
    "folke/snacks.nvim",             -- for input provider snacks
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",        -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
