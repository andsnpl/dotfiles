local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set({ "x" }, "p", "P") -- Default paste should not yank the deleted text
keymap.set("n", "]<space>", "o<esc>0Dk", { desc = "Add new line below" })
keymap.set("n", "[<space>", "O<esc>0Dj", { desc = "Add new line above" })
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sv", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set(
	"n",
	"<C-s>",
	'viw"ry:%s/<C-r>r/<C-r>r/gc<Left><Left><Left>',
	{ desc = "Start substitution on the word under the cursor" }
)
keymap.set(
	"x",
	"<C-s>",
	'"ry<esc>:%s/<C-r>r/<C-r>r/gc<Left><Left><Left>',
	{ desc = "Start substitution on the text under the cursor" }
)
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Write the current buffer" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit Neovim" })
keymap.set("n", "<leader>R", function()
	-- save the session
	vim.cmd({ cmd = "mksession", bang = true, args = { vim.env.NVIM_SESSION_FILE } }, {})
	-- exit with error code 222 so that the `nvim()` shell function will restart us
	vim.cmd({ cmd = "cq", count = 222 }, {})
end, { desc = "Restart Neovim" })

local ftmap = function(filetype, mode, lhs, rhs, opts)
	opts = opts or {}
	opts.buffer = true
	vim.api.nvim_create_autocmd("Filetype", {
		pattern = filetype,
		callback = function()
			vim.keymap.set(mode, lhs, rhs, opts)
		end,
	})
end

ftmap("help", "n", "q", "<cmd>q<CR>")
