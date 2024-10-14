return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
			},
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		-- Keymaps
		local keymap = vim.keymap

		local nvimTreeFocusOrToggle = function()
			local tree = require("nvim-tree.api").tree
			local currentBuf = vim.api.nvim_get_current_buf()
			local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
			if currentBufFt == "NvimTree" then
				tree.toggle()
			else
				tree.open({ find_file = true })
			end
		end

		keymap.set("n", "<leader>0", nvimTreeFocusOrToggle, { desc = "Toggle file explorer on current file" })

		-- Make :bd and :q behave as usual when tree is visible
		vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
			nested = false,
			callback = function(e)
				local tree = require("nvim-tree.api").tree

				-- Nothing to do if tree is not opened
				if not tree.is_visible() then
					return
				end

				-- How many focusable windows do we have? (excluding e.g. incline status window)
				local winCount = 0
				for _, winId in ipairs(vim.api.nvim_list_wins()) do
					if vim.api.nvim_win_get_config(winId).focusable then
						winCount = winCount + 1
					end
				end

				-- We want to quit and only one window besides tree is left
				if e.event == "QuitPre" and winCount == 2 then
					vim.api.nvim_cmd({ cmd = "qall" }, {})
				end

				-- :bd was probably issued an only tree window is left
				-- Behave as if tree was closed (see `:h :bd`)
				if e.event == "BufEnter" and winCount == 1 then
					-- Required to avoid "Vim:E444: Cannot close last window"
					vim.defer_fn(function()
						-- close nvim-tree: will go to the last buffer used before closing
						tree.toggle({ find_file = true, focus = true })
						-- re-open nivm-tree
						tree.toggle({ find_file = true, focus = false })
					end, 10)
				end
			end,
		})
	end,
}
