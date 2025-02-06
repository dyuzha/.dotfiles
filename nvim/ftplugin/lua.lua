vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.api.nvim_set_keymap("n", ",r",
  "<cmd>lua _Exec_cmd_on_current_file('lua')<CR>",
  { noremap = true, silent = true })


