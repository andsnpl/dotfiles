return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			mode = { "x", "n" },
			{ "<leader>c", group = "Config|Code actions" },
			{ "<leader>e", group = "Exec" },
			{ "<leader>f", group = "Fuzzy finder" },
			{ "<leader>l", group = "Lazygit" },
			{ "<leader>m", group = "Make" },
			{ "<leader>p", group = "Print" },
			{ "<leader>r", group = "Refactorings" },
			{ "<leader>s", group = "Splits" },
			{ "<leader>t", group = "Theme" },
			{ "<leader>x", group = "Diagnostics" },
		},
	},
}
