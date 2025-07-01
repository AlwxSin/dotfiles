return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            {
                "fredrikaverpil/neotest-golang",
                version = "*",
                dependencies = {
                    "andythigpen/nvim-coverage",
                },
            },
        },
        keys = {
            { "<leader>ta", function() require("neotest").run.attach() end,                                      desc = "[t]est [a]ttach" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                       desc = "[t]est run [f]ile" },
            { "<leader>tA", function() require("neotest").run.run(vim.uv.cwd()) end,                             desc = "[t]est [A]ll files" },
            { "<leader>tS", function() require("neotest").run.run({ suite = true }) end,                         desc = "[t]est [S]uite" },
            { "<leader>tt", function() require("neotest").run.run() end,                                         desc = "[t]est [n]earest" },
            { "<leader>tl", function() require("neotest").run.run_last() end,                                    desc = "[t]est [l]ast" },
            { "<leader>ts", function() require("neotest").summary.toggle() end,                                  desc = "[t]est [s]ummary" },
            { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end,  desc = "[t]est [o]utput" },
            { "<leader>tO", function() require("neotest").output_panel.toggle() end,                             desc = "[t]est [O]utput panel" },
            { "<leader>tx", function() require("neotest").run.stop() end,                                        desc = "[t]est [t]erminate" },
            { "<leader>td", function() require("neotest").run.run({ suite = false, strategy = "dap" }) end,      desc = "Debug nearest test" },
            { "<leader>tD", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, desc = "Debug current file" },
            { "<leader>tct", function() require("coverage").toggle() end,                                      desc = "[t]est [c]overage [t]oggle" },
            { "<leader>tcl", function() require("coverage").load(true) end,                                      desc = "[t]est [c]overage [l]oad" },
        },
        config = function()
            local neotest_golang_opts = {
                runner = "go",
                testify_enabled = true,
                go_test_args = {
                    "-v",
                    "-race",
                    "-count=1",
                    "-coverpkg=./...",
                    "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out",
                },
            }
            require("neotest").setup({
                adapters = {
                    require("neotest-golang")(neotest_golang_opts),
                },
            })
            require("coverage").setup({})
        end,
    },
}
