return {
	treesitter_parsers = {
		"python",
	},
	language_servers = {
		"pyright",
	},
	linters_by_ft = {
		python = { "pylint" },
	},
	formatters_by_ft = {
		python = { "isort", "black" },
	},
}
