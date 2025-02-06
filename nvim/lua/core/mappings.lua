vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

-- Featch
vim.keymap.set('i', 'jk', '<Esc>la', opts)
vim.keymap.set('n', '<Esc>', ':nohl<CR>', opts)
vim.keymap.set('n', ',w', ':set wrap!<CR>', opts)
vim.keymap.set('n', ',n', ':set number! | set relativenumber!<CR>', opts)
vim.keymap.set('n', ',ev', ':e ~/.config/nvim/lua/core/configs.lua<CR>', opts)
vim.keymap.set('n', '<leader>/', ':CommentToggle<CR>', opts)


-- NeoTree
vim.keymap.set('n', '<leader>e', ':Neotree float focus<CR>', opts)
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>', opts)

vim.keymap.set('n', '<c-k>', '<c-w><Up>', opts)
vim.keymap.set('n', '<c-j>', '<c-w><Down>', opts)
vim.keymap.set('n', '<c-h>', '<c-w><left>', opts)
vim.keymap.set('n', '<c-l>', '<c-w><Right>', opts)


-- BufferLine
vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)

vim.keymap.set('n', '<leader>c', ':bdelete<CR>', opts)
vim.keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>', opts)


-- Terminal
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', {desc = 'Terminal float'})
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', {desc = 'Terminal horizontal'})
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>', {desc = 'Terminal vertical'})


-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Telescope find files'})
vim.keymap.set('n', '<leader>fb', ':Telescope bufers<CR>', {desc = 'Telescope buffers'})
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', {desc = 'Telescope live grep'})
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', {desc = 'Telescope help tag'})

