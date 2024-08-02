return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"lukas-reineke/cmp-rg",
		"tzachar/fuzzy.nvim",
		"tzachar/cmp-fuzzy-buffer",
		"tzachar/cmp-fuzzy-path",
		"roobert/tailwindcss-colorizer-cmp.nvim",
		"onsails/lspkind.nvim",
		{
			"luckasRanarison/tailwind-tools.nvim",
			opts = {
				extension = {
					patterns = {
						javascript = { "clsx%(([^)]+)%)" },
					},
				},
			},
		},
		"lukas-reineke/cmp-under-comparator",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		luasnip.config.setup()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<Tab>"] = cmp.mapping.select_next_item(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<Enter>"] = cmp.mapping.confirm({ select = true }),
				["<Esc>"] = cmp.mapping.abort(),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sorting = {
				priority_weight = 2,
				comparators = {
					require("cmp_fuzzy_buffer.compare"),
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					require("cmp-under-comparator").under,
					cmp.config.compare.recently_used,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
			sources = {
				-- {
				--   name = "lazydev",
				--   group_index = 0,
				-- },
				{ name = "nvim_lsp" },
				{ name = "rg", keyword_length = 3 },
				{ name = "luasnip" },
				{ name = "fuzzy_buffer" },
				{ name = "fuzzy_path" },
			},
			formatting = {
				format = require("lspkind").cmp_format({
					before = require("tailwind-tools.cmp").lspkind_format,
				}),
			},
		})
	end,
}
