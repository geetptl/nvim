return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },

    config = function()
        print("mason-lspconfig called")
        local lspconfig = require("lspconfig")
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                border = "rounded"
            }
        })

        local orig_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or "rounded"
            return orig_open_floating_preview(contents, syntax, opts, ...)
        end

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

        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "pyright" },
            handlers = {
                function(server)
                    print("Inside handler" .. server.name)
                    lspconfig[server].setup({
                        on_attach = function(client, bufnr)
                            print("attached" .. client.name)
                            local opts = function(desc)
                                return { buffer = bufnr, desc = desc }
                            end
                            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("LSP Hover"))
                            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to Definition"))
                            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to Declaration"))
                            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to Implementation"))
                            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to References"))
                            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
                            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
                            vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format({ async = true }) end, opts("Format"))
                            vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts("Line Diagnostics"))
                            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts("Signature Help"))
                        end
                    })
                end,
            }
        })
    end
}
