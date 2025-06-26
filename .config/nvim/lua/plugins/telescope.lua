return {
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    {
        "nvim-telescope/telescope-symbols.nvim",
    },
    {
        "nvim-telescope/telescope-dap.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        -- tag = "0.1.8",
        commit = "b4da76b",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                pickers = {
                    find_files = { hidden = true, no_ignore = true, no_ignore_parent = true },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "telescope [F]ind in files [G]rep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "telescope [F]ind in [B]uffers" })
            vim.keymap.set(
                "n",
                "<leader>fB",
                builtin.current_buffer_fuzzy_find,
                { desc = "telescope [F]ind in current [B]uffer" }
            )
            vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "telescope [F]ind in [D]iagnostics" })
            vim.keymap.set("n", "<leader>fc", builtin.git_commits, { desc = "telescope [F]ind in [G]it [C]ommits" })
            vim.keymap.set(
                "n",
                "<leader>fBc",
                builtin.git_bcommits,
                { desc = "telescope [F]ind in [G]it current [B]uffer [C]commits" }
            )
            vim.keymap.set("n", "<leader>fr", builtin.git_branches, { desc = "telescope [F]ind in [G]it [Br]anches" })
            vim.keymap.set(
                "n",
                "<leader>ft",
                builtin.builtin,
                { desc = "telescope [F]ind in [T]elescope builtin pickers" }
            )
            vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "telescope find old files" })
            vim.keymap.set(
                "n",
                "<leader>fds",
                builtin.lsp_document_symbols,
                { desc = "telescope [F]ind LSP [D]ocument [S]ymbols" }
            )

            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("dap")
        end,
    },
}
