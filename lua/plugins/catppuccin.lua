return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        require('catppuccin').setup({
            no_italic = true
        });
        vim.cmd.colorscheme('catppuccin-mocha')
    end
}
