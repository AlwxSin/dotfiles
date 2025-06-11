return {
    {
        "buoto/gotests-vim",
        -- cweill/gotest should be installed (through Mason)
    },
    {
        "edolphin-ydf/goimpl.nvim",
        -- josharian/impl should be installed (through Mason)
        config = function()
            require("telescope").load_extension("goimpl")
            vim.keymap.set("n", "<leader>im", function()
                require("telescope").extensions.goimpl.goimpl({})
            end, { desc = "generate [Im]plementation of interface" })
        end,
    },
}
