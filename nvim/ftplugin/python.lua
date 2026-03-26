vim.opt.colorcolumn = "80"

local function map_run(key, cmd)
  vim.keymap.set("n", key, function()

    if vim.bo.modified then
      vim.cmd("write")
    end

    _Exec_cmd_on_current_buf(cmd)
  end, { silent = true, desc = "Run " .. cmd })
end

map_run(",r", "poetry run python")
map_run(",t", "poetry run pytest")

-- local venv_selector =
-- vim.cmd("VenvSelectCached")
