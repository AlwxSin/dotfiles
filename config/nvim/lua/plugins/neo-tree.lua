return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- hide filtered items on open
					hide_gitignored = false,
					hide_dotfiles = false,
					hide_by_name = {
						-- ".github",
						-- ".gitignore",
						-- "package-lock.json",
						-- ".changeset",
						-- ".prettierrc.json",
					},
					never_show = { ".git" },
				},
			},
		})
	end,
}
