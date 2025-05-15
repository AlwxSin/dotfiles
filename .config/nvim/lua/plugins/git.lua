return {
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            local gitsigns = require("gitsigns")
            gitsigns.setup()

            -- Navigation
            vim.keymap.set("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "]c", bang = true })
                else
                    gitsigns.nav_hunk("next")
                end
            end, { desc = "Jump to next git [c]hange" })

            vim.keymap.set("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal({ "[c", bang = true })
                else
                    gitsigns.nav_hunk("prev")
                end
            end, { desc = "Jump to prev git [c]hange" })

            -- Actions
            -- visual mode
            vim.keymap.set("v", "<leader>hs", function()
                gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "git [s]tage hunk" })
            vim.keymap.set("v", "<leader>hr", function()
                gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "git [r]eset hunk" })

            -- normal mode
            vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
            vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git reset hunk" })
            vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
            vim.keymap.set("n", "<leader>hu", gitsigns.stage_hunk, { desc = "git [u]ndo stage hunk" })
            vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
            vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
            vim.keymap.set("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })
            vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
            vim.keymap.set("n", "<leader>hD", function()
                gitsigns.diffthis("@")
            end, { desc = "git [D]iff against last commit" })
            -- Toggles
            vim.keymap.set(
                "n",
                "<leader>htb",
                gitsigns.toggle_current_line_blame,
                { desc = "[T]oggle git show [b]lame line" }
            )
            vim.keymap.set("n", "<leader>htD", gitsigns.preview_hunk_inline, { desc = "[T]oggle git show [D]eleted" })
        end,
    },
}
