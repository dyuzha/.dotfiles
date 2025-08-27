local Terminal = require('toggleterm.terminal').Terminal

-- Функция выполняет команду над текущем буфером
function _Exec_cmd_on_current_buf(cmd)
  local file_name = vim.api.nvim_buf_get_name(0)
  local run_code = Terminal:new(
    {
      cmd = cmd .. " " .. file_name,
      hidden = true,
      close_on_exit = false, -- close the terminal window when the process exits

      -- Only for float direction
      -- display_name = vim.api.nvim_buf_get_name(0), -- File name
      direction = "horizontal",
    })

  run_code:toggle()
end

-- LazyGit
function _Lazygit_toggle()
  local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
    -- function to run on opening the terminal
    on_open = function()
      vim.cmd("startinsert!")
    end,
    -- function to run on closing the terminal
    on_close = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
  })
    lazygit:toggle()
end


-- vim.lsp.set_log_level("debug")
