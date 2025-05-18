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
vim.opt.clipboard = "unnamedplus"

-- leader
vim.g.mapleader = " "

-- disable arrow keys
vim.keymap.set({"n", "i", "v"}, "<Up>", "<cmd>:echoe 'NOP!'<CR>")
vim.keymap.set({"n", "i", "v"}, "<Down>", "<cmd>:echoe 'NOP!'<CR>")
vim.keymap.set({"n", "i", "v"}, "<Left>", "<cmd>:echoe 'NOP!'<CR>")
vim.keymap.set({"n", "i", "v"}, "<Right>", "<cmd>:echoe 'NOP!'<CR>")

-- search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.incsearch = true

-- remove trailing spaces and lines
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
        vim.cmd([[%s/\($\n\s*\)\+\%$//e]])
    end
})

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end
})

require("config.lazy")
