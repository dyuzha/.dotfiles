vim.api.nvim_set_keymap("n", ",r",
  "<cmd>lua _Exec_cmd_on_current_buf('python')<CR>",
  { noremap = true, silent = true })

-- vim.opt.colorcolumn = 80
