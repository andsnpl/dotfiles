local formatters_by_ft = require("paul.lang").formatters_by_ft

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = formatters_by_ft,
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				local bvar = vim.b[bufnr].disable_autoformat
				local bvar_set = bvar ~= nil
				local gvar = vim.g.disable_autoformat
				-- buffer-local var takes precedence if it is set
				if bvar or (not bvar_set and gvar) then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				}
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Make pretty" })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting globally
				vim.g.disable_autoformat = true
				for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
					vim.b[bufnr].disable_autoformat = nil
				end
			else
				vim.b.disable_autoformat = true
			end
		end, {
			desc = "Disable format-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function(args)
			if args.bang then
				-- FormatEnable! will enable formatting globally
				vim.g.disable_autoformat = false
				for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
					vim.b[bufnr].disable_autoformat = nil
				end
			else
				vim.b.disable_autoformat = false
			end
		end, {
			desc = "Enable format-on-save",
			bang = true,
		})
	end,
}
