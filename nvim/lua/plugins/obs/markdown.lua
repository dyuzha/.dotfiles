return {
  'preservim/vim-markdown',
  config = function()
    vim.g.vim_markdown_auto_insert_bullets = 0
    vim.g.vim_markdown_new_list_item_indent = 0
  end,
}
