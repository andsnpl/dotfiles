return {
	"RRethy/nvim-treesitter-endwise",
	ft = { "bash", "elixir", "fish", "julia", "lua", "ruby", "vimscript" },
	dependencies = {
		"nvim-treesitter",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			endwise = {
				enable = true,
			},
		})
	end,
}
