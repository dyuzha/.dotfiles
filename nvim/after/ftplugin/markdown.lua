-- Встроенный ftplugin markdown.lua снимает [[ / ]] через `sil! exe "nunmap"`.
-- При повторном FileType (syntax on после чтения буфера) этот exe не глушит E31.
local undo = vim.b.undo_ftplugin
if type(undo) ~= "string" then
  return
end

local function strip(s, needle)
  local i, j = s:find(needle, 1, true)
  if not i then
    return s
  end
  return s:sub(1, i - 1) .. s:sub(j + 1)
end

undo = strip(undo, '\n sil! exe "nunmap <buffer> gO"')
undo = strip(
  undo,
  '\n sil! exe "nunmap <buffer> ]]" | sil! exe "nunmap <buffer> [["'
)

-- Одна строка: :lua забирает следующие строки undo и ломает разбор.
vim.b.undo_ftplugin = undo
  .. "\n lua for _, k in ipairs({ 'gO', ']]', '[[' }) do pcall(vim.keymap.del, 'n', k, { buffer = true }) end"
