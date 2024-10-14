return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local refactoring = require("refactoring")

		refactoring.setup({
			show_success_message = true,
		})
	end,
	keys = {
		{ "<leader>re", ":Refactor extract ", mode = "x", desc = "Extract function" },
		{ "<leader>rf", ":Refactor extract_to_file ", mode = "x", desc = "Extract function to file" },
		{ "<leader>rv", ":Refactor extract_var ", mode = "x", desc = "Extract variable" },
		{ "<leader>ri", ":Refactor inline_var", mode = { "n", "x" }, desc = "Inline variable" },
		{ "<leader>rI", ":Refactor inline_func", mode = "n", desc = "Inline function" },
		{
			"<leader>pv",
			function()
				require("refactoring").debug.print_var({ below = true })
			end,
			mode = { "x", "n" },
			desc = "Print variable",
		},
		{
			"<leader>pp",
			function()
				require("refactoring").debug.printf({ below = true })
			end,
			mode = "n",
			desc = "Print debug statement",
		},
		{
			"<leader>px",
			function()
				require("refactoring").debug.cleanup({})
			end,
			mode = "n",
			desc = "Clean up print statements",
		},
	},
}
