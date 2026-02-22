local providers = {
    openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
        timeout = 30000,  -- Timeout in milliseconds, increase this for reasoning models
        extra_request_body = {
            temperature = 0.75,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        },
    },
}

local flant_models = {
    ["deepseek-v3"]       = "Default - дешево и качественно",
    ["deepseek-r1"]       = "Думают пошагово, объясняют решение",
    ["gpt-4o"]            = "Картинки / графики",
    ["gpt-5.2"]           = "Флагман для критичных кейсов",
    ["gpt-5.2-codex"]     = "Флагман для написания кода",
    ["o3-mini"]           = "Фикс бага / рефактор / Reasoning",
    ["claude-sonnet-4.5"] = "Флагман для критичных кейсов / Лучший стиль письма",
    ["grok-4"]            = "Без цензуры, дерзкая",
    ["gemini-3-flash"]    = "Фикс бага / рефактор / Быстрый универсал / Дешево и качественно",
    ["gemini-3-pro"]      = "Огромный контекст и миллионы токенов (книги, логи)",
    ["qwen3-coder-plus"]  = "Флагман для написания кода",
}


for model, desc in pairs(flant_models) do
    providers["flant/" .. model] = {
        endpoint = "https://4o.flant.ru/api/v1",
        __inherited_from = 'openai',
        api_key_name = 'FLANT_AI_API_KEY',
        model = model,
        display_name = "flant/" .. model .. " - " .. desc,
        timeout = 30000,
    }
end


return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
        provider = "flant/deepseek-v3",
        providers = providers,
    },
    build = "make",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        -- "echasnovski/mini.pick",   -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
        -- "ibhagwan/fzf-lua",        -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
        -- "zbirenbaum/copilot.lua",  -- for providers='copilot'
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    verbose = false,
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
