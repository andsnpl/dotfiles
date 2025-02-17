local treesitter_parsers = {}
local treesitter_parsers_by_ft = {}
local language_servers = {}
local language_server_configs = {}
local linters_by_ft = {}
local linter_setup_functions = {}
local formatters_by_ft = {}
local formatter_setup_functions = {}

local module_allowed_keys = {
	treesitter_parsers = 1,
	treesitter_parsers_by_ft = 1,
	language_servers = 1,
	linters_by_ft = 1,
	linter_setup = 1,
	formatters_by_ft = 1,
	formatter_setup = 1,
}
local validate_module = function(lang, mod)
	for k, _ in pairs(mod) do
		if module_allowed_keys[k] ~= 1 then
			error("You have a typo in the " .. lang .. " module")
		end
	end
end

local union_all = function(tbl)
	local dict = {}
	for _, list in pairs(tbl) do
		for _, elem in ipairs(list) do
			dict[elem] = 1
		end
	end
	local final = {}
	for k, _ in pairs(dict) do
		final[#final + 1] = k
	end
	return final
end

for _, lang in ipairs({ "bash", "c", "fsharp", "lua", "markdown", "misc_lang", "php", "python", "web" }) do
	local mod = require("paul.lang." .. lang)
	validate_module(lang, mod)
	treesitter_parsers = vim.list_extend(treesitter_parsers, mod.treesitter_parsers or {})
	for ft, parser in pairs(mod.treesitter_parsers_by_ft or {}) do
		table.insert(treesitter_parsers, parser)
		treesitter_parsers_by_ft[ft] = parser
	end
	for _, server in ipairs(mod.language_servers or {}) do
		if type(server) == "table" then
			local servername, config = table.unpack(server)
			language_servers[#language_servers + 1] = servername
			language_server_configs[servername] = config
		else
			language_servers[#language_servers + 1] = server
		end
	end
	linters_by_ft = vim.tbl_deep_extend("force", linters_by_ft, mod.linters_by_ft or {})
	if mod.linter_setup ~= nil then
		table.insert(linter_setup_functions, mod.linter_setup)
	end
	formatters_by_ft = vim.tbl_deep_extend("force", formatters_by_ft, mod.formatters_by_ft or {})
	if mod.formatter_setup ~= nil then
		table.insert(formatter_setup_functions, mod.formatter_setup)
	end
end

local linters = union_all(linters_by_ft)
local formatters = union_all(formatters_by_ft)

return {
	treesitter_parsers = treesitter_parsers,
	treesitter_parsers_by_ft = treesitter_parsers_by_ft,
	language_servers = language_servers,
	language_server_configs = language_server_configs,
	linters = linters,
	linters_by_ft = linters_by_ft,
	linters_setup = function()
		for _, setup in ipairs(linter_setup_functions) do
			setup()
		end
	end,
	formatters = formatters,
	formatters_by_ft = formatters_by_ft,
	formatters_setup = function()
		for _, setup in ipairs(formatter_setup_functions) do
			setup()
		end
	end,
}
