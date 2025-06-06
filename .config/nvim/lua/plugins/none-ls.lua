return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.formatting.gofumpt,
				-- null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines,
				-- null_ls.builtins.formatting.gci,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "lsp format buffer" })
	end,
}
