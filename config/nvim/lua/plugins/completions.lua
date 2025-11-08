return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"onsails/lspkind.nvim",
			{
				"MattiasMTS/cmp-dbee",
				dependencies = {
					"kndndrj/nvim-dbee",
				},
				ft = "sql",
				opts = {},
			},
		},
		config = function()
			local cmp, lspkind, luasnip = require("cmp"), require("lspkind"), require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			luasnip.add_snippets("go", require("snippets.go"))

			local kind_formatter = lspkind.cmp_format({
				mode = "symbol_text",
				menu = {
					buffer = "[buf]",
					nvim_lsp = "[LSP]",
					nvim_lua = "[api]",
					path = "[path]",
					luasnip = "[snip]",
				},
			})

			-- local kind_formatter = l
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert,
							select = true,
						}),
						{ "i", "c" }
					),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "lazydev", group_index = 0 },
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "cmp-dbee" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "render-markdown" },
				}),
				formatting = {
					fields = { "abbr", "kind", "menu" },
					expandable_indicator = true,
					format = function(entry, vim_item)
						-- Lspkind setup for icons
						vim_item = kind_formatter(entry, vim_item)

						return vim_item
					end,
				},
			})
		end,
	},
}
