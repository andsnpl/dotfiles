return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = { "VeryLazy" },
		config = function()
			local toggleterm = require("toggleterm")

			toggleterm.setup({})

			local keymap = vim.keymap

			keymap.set({ "n", "x", "i", "t" }, "<C-\\>", function()
				local count = vim.v.count1
				if count == 0 then
					toggleterm.toggle_all()
				else
					toggleterm.toggle(count)
				end
			end, { desc = "Toggle default terminal" })

			keymap.set("n", "<leader>b", function()
				local cmd = "eval $(~/bin/makeme build)"
				toggleterm.exec(cmd, 1)
			end, { desc = "Build project" })

			keymap.set("n", "<leader>mr", function()
				local cmd = "eval $(~/bin/makeme run)"
				toggleterm.exec(cmd, 1)
			end, { desc = "Make run" })

			keymap.set("n", "<leader>mw", function()
				local cmd = "eval $(~/bin/makeme watch)"
				toggleterm.exec(cmd, 2)
			end, { desc = "Make watch" })

			keymap.set("n", "<leader>mt", function()
				local cmd = "eval $(~/bin/makeme test)"
				toggleterm.exec(cmd, 3)
			end, { desc = "Make test" })

			keymap.set("n", "<C-x>", "<cmd>ToggleTermSendCurrentLine<CR> 1", { desc = "Exec current line" })
			keymap.set("x", "<C-x>", "<cmd>ToggleTermSendVisualSelection 1<CR>", { desc = "Exec selection" })
		end,
	},
}
