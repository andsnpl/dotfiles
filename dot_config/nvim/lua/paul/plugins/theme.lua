return {
	"zaldih/themery.nvim",
	lazy = false,
	dependencies = {
		"ellisonleao/gruvbox.nvim",
		"folke/tokyonight.nvim",
		"Shatur/neovim-ayu",
		{
			"lukas-reineke/indent-blankline.nvim",
		},
	},
	config = function()
		local ayu = require("ayu")
		local ayucolors = require("ayu.colors")
		local ibl = require("ibl")

		ayucolors.generate(false)

		ayu.setup({
			overrides = {
				Normal = { bg = "None" },
				ColorColumn = { bg = "None" },
				SignColumn = { bg = "None" },
				Folded = { bg = "None" },
				FoldColumn = { bg = "None" },
				CursorLine = { bg = "None" },
				CursorColumn = { bg = "None" },
				WhichKeyFloat = { bg = "None" },
				VertSplit = { bg = "None" },
				Visual = { bg = ayucolors.bg },
				LineNr = { fg = ayucolors.fg },
			},
		})

		ibl.setup({
			indent = {
				char = "┊",
				tab_char = "|",
				highlight = "Comment",
			},
		})

		require("themery").setup({
			themes = {
				"gruvbox",
				"ayu",
				"tokyonight",
			},
			livePreview = true,
		})

		vim.keymap.set("n", "<leader>tt", "<cmd>Themery<CR>", { desc = "Activate theme picker" })
	end,
}
