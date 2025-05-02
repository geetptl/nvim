return {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config = true },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim", "nvim-lspconfig" },

        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            local on_attach = function(client, bufnr)
                local opts = { buffer = bufnr }

                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            end

            mason_lspconfig.setup({
                ensure_installed = { "lua_ls", "pyright", "gopls" },
            })

            mason_lspconfig.setup_handlers({
                function(server)
                    lspconfig[server].setup({
                        on_attach = on_attach
                    })
                end,
            })
        end
    }
}
