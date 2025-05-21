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

-- disable arrow keys
vim.keymap.set({ "n", "v" }, "<Up>", "<cmd>:echoe 'NOP!'<CR>")
vim.keymap.set({ "n", "v" }, "<Down>", "<cmd>:echoe 'NOP!'<CR>")
vim.keymap.set({ "n", "v" }, "<Left>", "<cmd>:echoe 'NOP!'<CR>")
vim.keymap.set({ "n", "v" }, "<Right>", "<cmd>:echoe 'NOP!'<CR>")

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

-- add border to floating previews
local orig_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or "rounded"
    return orig_open_floating_preview(contents, syntax, opts, ...)
end

-- diagnostic line config
vim.diagnostic.config({
    virtual_text = {
        severity = nil,
        source = "if_many",
        prefix = "■",
        spacing = 4,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- lsp shortcuts
vim.keymap.set("n", "gf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format current file" })

require("config.lazy")
