return {
    {
        "yanskun/gotests.nvim",
        ft = "go",
        config = function()
            require("gotests").setup()
        end,
        keys = {
            {
                "<leader>Gtt",
                function()
                    vim.cmd "GoTests"
                end,
                mode = { "n" },
                desc = "Go generate test"
            },
            {
                "<leader>Gta",
                function()
                    vim.cmd "GoTestsAll"
                end,
                mode = { "n" },
                desc = "Go generate tests for each function in file"
            },

        }

    },
    {
        "fang2hou/go-impl.nvim",
        ft = "go",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/snacks.nvim",
        },
        opts = {},
        keys = {
            {
                "<leader>Gi",
                function()
                    require("go-impl").open()
                end,
                mode = { "n" },
                desc = "Go generate implementation for interface",
            },
        },
    },
}
