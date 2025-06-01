local g = vim.g
local opt = vim.opt
local wo = vim.wo


-- Line Numbers
wo.number = true
wo.relativenumber = true

opt.number = true
opt.relativenumber = true

-- nvim tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1


vim.api.nvim_command('filetype plugin indent on')

g.did_load_filetypes = 1
g.formatoptions = "qrn1"
opt.showmode = false
opt.updatetime = 100
wo.signcolumn = "yes"
opt.scrolloff = 8
opt.wrap = false
wo.linebreak = true
opt.virtualedit = "block"
opt.undofile = true
opt.shell = "/bin/zsh"
opt.termguicolors = true
opt.cursorline = true -- Подсветка строки с курсором


-- Mouse
opt.mouse = "a"
opt.mousefocus = true


-- Splits
opt.splitbelow = true
opt.splitright = true


-- Clipboard
opt.clipboard = "unnamedplus"

--Indent Settings
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true

--Fill
opt.fillchars = {
  -- vert = "|",
  --  fold = " ",
  -- end = " ", -- suppress ~ at EndOfBuffer
  -- diff = " ",
  -- msgsep = "-",
  -- foldopen = "+",
  -- foldsep = "|",
  -- foldclose = " "
}

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "",
    },
  },
})

-- Toggle terminal
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Obsidian
opt.conceallevel = 1

-- Markdown
g.vim_markdown_borderless_table = 1
g.vim_markdown_folding_disabled = 1

-- Langmapper
local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift) .. ';' .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')

-- monkey-patch для управления размером и границей hover-окна
local util = vim.lsp.util

local original_open_floating_preview = util.open_floating_preview
util.open_floating_preview = function(contents, filetype, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  opts.max_width = opts.max_width or 100
  opts.max_height = opts.max_height or 40
  return original_open_floating_preview(contents, filetype, opts, ...)
end


vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    if vim.fn.isdirectory(vim.fn.expand("<amatch>")) ~= 0 then
      require("neo-tree")
      vim.cmd("Neotree filesystem left")
    end
  end,
})

--
-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     local arg = vim.fn.argv()[1]
--     if arg and vim.fn.isdirectory(arg) == 1 then
--       -- Закрываем текущий пустой буфер
--       vim.cmd("enew | silent! bwipeout #")
--       -- Открываем Neotree в левом буфере
--       vim.cmd("Neotree filesystem left")
--     end
--   end,
-- })


