local utf8 = require('lua-utf8')

local function bold_first_letter(str)
  -- Разбиваем строку на слова
  local words = vim.split(str, "%s+")

  -- Проходим по каждому слову
  for i, word in ipairs(words) do
    -- Если слово не пустое, обрамляем первую букву символом «*"
    if word ~= "" then
      local first_char = utf8.sub(word, 1, 1)
      local rest_of_word = utf8.sub(word, 2)
      words[i] = "*" .. first_char .. "*" .. rest_of_word
    end
  end

  -- Возвращаем строку, объединяя слова
  return table.concat(words, " ")
end


vim.api.nvim_create_user_command('BoldLetter', function()
  -- Получаем текущую строку
  local current_line = vim.api.nvim_get_current_line()
  -- Применяем функцию к текущей строке и получаем результат
  local result = bold_first_letter(current_line)
  -- Устанавливаем результат обратно в буфер, заменяя текущую строку
  vim.api.nvim_set_current_line(result)
end, {
  nargs = 0,
})
