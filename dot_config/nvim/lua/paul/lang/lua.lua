return {
	treesitter_parsers = {
		"lua",
	},
	language_servers = {
		{
			"lua_ls",
			{
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
	},
}
