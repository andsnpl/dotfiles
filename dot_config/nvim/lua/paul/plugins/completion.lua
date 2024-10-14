return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-u>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-c>"] = cmp.mapping.abort(),
				["<C-E>"] = cmp.config.disable, -- Previously mapped to abort(). Will be used to expand snippets
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})

		local keymap = vim.keymap

		---
		--- Luasnip keymaps
		---

		local cycle_choices = function(n)
			if luasnip.choice_active() then
				luasnip.change_choice(n)
			end
		end

		keymap.set({ "i" }, "<C-e>", function()
			luasnip.expand()
		end, { silent = true, desc = "Expand snippet" })

		keymap.set({ "i", "s" }, "<Tab>", function()
			luasnip.jump(1)
		end, { silent = true, desc = "Jump to next slot" })

		keymap.set({ "i", "s" }, "<S-Tab>", function()
			luasnip.jump(-1)
		end, { silent = true, desc = "Jump to prev slot" })

		keymap.set({ "i", "s" }, "<C-n>", function()
			cycle_choices(1)
		end, { silent = true, desc = "Cycle snippet choices" })

		keymap.set({ "i", "s" }, "<C-p>", function()
			cycle_choices(-1)
		end, { silent = true, desc = "Cycle snippet choices backwards" })
	end,
}
