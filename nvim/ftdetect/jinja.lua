-- vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
--   pattern = "*.json.jinja",
--   callback = function()
--     vim.bo.filetype = "jinja.json"
--   end,
-- })

-- В init.lua или отдельный файл в after/ftdetect/
vim.filetype.add({
    extension = {
        ["json.j2"] = "json",       -- Основной тип — JSON
        ["json.jinja"] = "json",
        ["json.jinja2"] = "json",
    },
    pattern = {
        [".+%.json%.j2"] = "json",
        [".+%.json%.jinja"] = "json",
        [".+%.json%.jinja2"] = "json",
    },
})
