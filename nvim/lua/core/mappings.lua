vim.g.mapleader = " "

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Featch
keymap.set('i', 'jk', '<Esc>la', opts)
keymap.set('n', '<Esc>', ':nohl<CR>', opts)
keymap.set('n', ',w', ':set wrap!<CR>', opts)
keymap.set('n', ',n', ':set number! | set relativenumber!<CR>', opts)
keymap.set('n', ',ev', ':e ~/.config/nvim/lua/core/configs.lua<CR>', opts)
keymap.set('n', '<leader>/', ':CommentToggle<CR>', opts)
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _Lazygit_toggle()<CR>", { noremap = true, silent = true })


-- NeoTree
keymap.set('n', '<leader>e', ':Neotree float focus<CR>', opts)
keymap.set('n', '<leader>o', ':Neotree float git_status<CR>', opts)

keymap.set('n', '<c-k>', '<c-w><Up>', opts)
keymap.set('n', '<c-j>', '<c-w><Down>', opts)
keymap.set('n', '<c-h>', '<c-w><left>', opts)
keymap.set('n', '<c-l>', '<c-w><Right>', opts)


-- BufferLine
keymap.set('n', ']b', ':BufferLineCycleNext<CR>', opts)
keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', opts)
keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', opts)
keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)
keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', opts)

keymap.set('n', '<leader>c', ':bdelete<CR>', opts)
keymap.set('n', '<leader>x', ':BufferLinePickClose<CR>', opts)


-- Terminal
keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Terminal float' })
keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Terminal horizontal' })
keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical size=40<CR>', { desc = 'Terminal vertical' })


-- Telescope
keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { desc = 'Telescope find files' })
keymap.set('n', '<leader>fb', ':Telescope bufers<CR>', { desc = 'Telescope buffers' })
keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = 'Telescope live grep' })
keymap.set('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = 'Telescope help tag' })
