return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-live-grep-args.nvim" }
    },
    config = function()
        local telescope = require('telescope')
        local builtin = require('telescope.builtin')
        local extensions = telescope.extensions

        telescope.load_extension('live_grep_args')

        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files', unpack(opts) })
        map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers', unpack(opts) })
        map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags', unpack(opts) })

        map('n', '<leader>fg', extensions.live_grep_args.live_grep_args, { desc = 'Telescope live grep with args', unpack(opts) })
    end
}
