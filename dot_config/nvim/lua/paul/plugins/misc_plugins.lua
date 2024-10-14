return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	{ "romainl/vim-cool", event = { "VeryLazy" } },
	{ "stevearc/dressing.nvim", event = { "VeryLazy" } },
	{
		"szw/vim-maximizer",
		keys = {
			{ "<leader>sm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},
}
