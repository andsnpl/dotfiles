return {
	treesitter_parsers_by_ft = {
		blade = "php",
		php = "php",
	},
	language_servers = {
		"phpactor",
	},
	-- linters_by_ft = {
	-- 	php = { "phpcs" },
	-- },
	-- linter_setup = function()
	-- 	--
	-- end,
	formatters_by_ft = {
		php = { "php-cs-fixer" },
	},
	formatter_setup = function()
		require("conform").formatters["php-cs-fixer"] = {
			command = "php-cs-fixer",
			args = {
				"fix",
				"$FILENAME",
				"--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
			},
			env = {
				PHP_CS_FIXER_IGNORE_ENV = true,
			},
			stdin = false,
		}
	end,
}
