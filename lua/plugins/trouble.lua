return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {},
	keys = {
		{
			"<leader>es",
			"<cmd>Trouble symbols toggle pinned=true win.relative=win win.position=right<cr>",
			desc = "toggle document symbols",
		},
		{
			"<leader>el",
			"<cmd>Trouble lsp toggle focus=false win.relative=win win.position=right<cr>",
			desc = "toggle lsp definitions/references",
		},
		{
			"<leader>ed",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "toggle diagnostics",
		},
		{
			"<leader>eD",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "buffer toggle diagnostics",
		},
	},
}
