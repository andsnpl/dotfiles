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

			keymap.set("n", "<leader><cr>", function()
				local f = vim.api.nvim_buf_get_name(0)
				local cmd = "makeme exec " .. f
				toggleterm.exec(cmd, 1)
			end)

			keymap.set("n", "<leader>mi", function()
				local cmd = "makeme install"
				toggleterm.exec(cmd, 1)
			end, { desc = "Install dependencies" })

			keymap.set("n", "<leader>mb", function()
				local cmd = "makeme build"
				toggleterm.exec(cmd, 1)
			end, { desc = "Build project" })

			keymap.set("n", "<leader>mx", function()
				local cmd = "makeme exec"
				toggleterm.exec(cmd, 1)
			end, { desc = "Execute program entrypoint" })

			keymap.set("n", "<leader>ms", function()
				local cmd = "makeme server"
				toggleterm.exec(cmd, 2)
			end, { desc = "Start server" })

			keymap.set("n", "<leader>mwx", function()
				local cmd = "makeme watchexec"
				toggleterm.exec(cmd, 2)
			end, { desc = "Watch exec" })

			keymap.set("n", "<leader>mt", function()
				local cmd = "makeme test"
				toggleterm.exec(cmd, 3)
			end, { desc = "Run test suite" })

			keymap.set("n", "<leader>mwt", function()
				local cmd = "makeme watchtest"
				toggleterm.exec(cmd, 3)
			end, { desc = "Watch test" })

			keymap.set("n", "<C-x>", "<cmd>ToggleTermSendCurrentLine<CR> 1", { desc = "Exec current line" })
			keymap.set("x", "<C-x>", "<cmd>ToggleTermSendVisualSelection 1<CR>", { desc = "Exec selection" })
		end,
	},
}
