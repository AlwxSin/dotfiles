return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = { hidden = true },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "telescope find in files" })
            vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "telescope find old files" })
            vim.keymap.set(
                "n",
                "<leader>fds",
                builtin.lsp_document_symbols,
                { desc = "telescope [F]ind LSP [D]ocument [S]ymbols" }
            )

            require("telescope").load_extension("ui-select")
        end,
    },
}
