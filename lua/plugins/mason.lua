return {
    "mason-org/mason.nvim",
    config = function ()
        local mason = require("mason")
        mason.setup({
            ui = {
                border = "rounded"
            }
        })
    end
}
