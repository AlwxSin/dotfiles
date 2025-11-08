return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                custom_highlights = function(colors)
                    return {
                        LineNr = { fg = colors.subtext0 },
                        CursorLineNr = { fg = colors.peach, style = { "bold" } },
                    }
                end,
            })
            vim.cmd.colorscheme("catppuccin-mocha")
        end,
    },
}
