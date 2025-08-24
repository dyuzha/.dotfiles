return {
  'linux-cultist/venv-selector.nvim',
  branch = "regexp", -- Новая версия
  -- dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  dependencies = {'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
  opts = {
    -- name = "venv",
    auto_refresh = false,
    search_venv_managers = true,
    search_workspase = false,
    -- poetry_path = "~/.cache/pypoetry/virtualenvs",
    stay_on_this_version = true, -- Чтобы не выскакивало **** сообщение о том, что у меня старая версия

  },
  lazy = false, -- Это вместо event = VeryLazy, чтобы отрабатывала команда VenvSelectCached при старте
  -- event = "VeryLazy",
  keys = {
    -- Keymap to open VenvSelector to pick a venv.
    -- { '<leader>vs', '<cmd>VenvSelect<cr>' },
    -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
    -- { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
  },
}
