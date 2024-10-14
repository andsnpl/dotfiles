return {
	treesitter_parsers = {
		"css",
		"graphql",
		"html",
		"javascript",
		"typescript",
		"tsx",
	},
	language_servers = {
		"cssls",
		"emmet-language-server",
		"graphql",
		"html",
		"tailwindcss",
		"ts_ls",
	},
	linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
	},
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier", "rustywind" },
		typescriptreact = { "prettier", "rustywind" },
		css = { "prettier" },
		html = { "prettier", "rustywind" },
		graphql = { "prettier" },
	},
}
