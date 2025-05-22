return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    build = function()
        require("dbee").install()
    end,
    config = function()
        local dbee = require("dbee")
        dbee.setup({
            sources = {
                require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
            },
        })
        vim.keymap.set("n", "<leader>dbee", dbee.toggle, { desc = "toggle dbee ui" })
    end,
}
