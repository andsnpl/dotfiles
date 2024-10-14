local lang = require("paul.lang")
local language_servers = lang.language_servers
local linters = lang.linters
local formatters = lang.formatters

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({})

		local ensure_installed = {}
		for _, list in ipairs({ language_servers, linters, formatters }) do
			vim.list_extend(ensure_installed, list)
		end

		mason_tool_installer.setup({
			ensure_installed = ensure_installed,
			auto_update = true,
		})
	end,
}
