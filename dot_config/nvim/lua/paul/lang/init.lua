local treesitter_parsers = {}
local language_servers = {}
local language_server_configs = {}
local formatters_by_ft = {}
local linters_by_ft = {}

local module_allowed_keys = { treesitter_parsers = 1, language_servers = 1, linters_by_ft = 1, formatters_by_ft = 1 }
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

for _, lang in ipairs({ "bash", "c", "fsharp", "lua", "markdown", "misc_lang", "ocaml", "python", "web" }) do
	local mod = require("paul.lang." .. lang)
	validate_module(lang, mod)
	treesitter_parsers = vim.list_extend(treesitter_parsers, mod.treesitter_parsers or {})
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
	formatters_by_ft = vim.tbl_deep_extend("force", formatters_by_ft, mod.formatters_by_ft or {})
end

local linters = union_all(linters_by_ft)
local formatters = union_all(formatters_by_ft)

return {
	treesitter_parsers = treesitter_parsers,
	language_servers = language_servers,
	language_server_configs = language_server_configs,
	linters_by_ft = linters_by_ft,
	formatters_by_ft = formatters_by_ft,
	linters = linters,
	formatters = formatters,
}
