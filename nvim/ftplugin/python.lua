vim.opt.colorcolumn = "80"

vim.api.nvim_set_keymap("n", ",r",
  "<cmd>lua _Exec_cmd_on_current_buf('poetry')<CR>",
  { noremap = true, silent = true })

-- local venv_selector =
-- vim.cmd("VenvSelectCached")
