return {
    {
        "echasnovski/mini.ai",
        version = false,
        config = function()
            require("mini.ai").setup()
        end,
    },
    {
        "echasnovski/mini.operators",
        version = false,
        config = function()
            require("mini.operators").setup()
        end,
    },
    {
        "echasnovski/mini.splitjoin",
        version = false,
        config = function()
            require("mini.splitjoin").setup()
        end,
    },
    {
        "echasnovski/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup()
        end,
    },
}
