return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")
	end,
	keys = {
		{
			"<leader><leader>",
			function()
				local builtin = require("telescope.builtin")
				if not pcall(builtin.git_files) then
					builtin.find_files()
				end
			end,
			desc = "Fuzzy find files in cwd",
		},
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
		{ "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Fuzzy find git files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
		{ "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
		{ "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help topic" },
		{ "<leader>fm", "<cmd>Telescope keymaps<cr>", desc = "Find keymapping" },
	},
}
