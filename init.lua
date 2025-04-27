-- numbers and cursor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- tabs and spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- leader
vim.g.mapleader = " "

require('config.lazy')

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

local telescope_extensions = require('telescope').extensions
vim.keymap.set('n', '<leader>fg', telescope_extensions.live_grep_args.live_grep_args, { desc = 'Telescope live grep with args' })

