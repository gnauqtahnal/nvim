return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"hrsh7th/cmp-nvim-lsp",
			{ "ray-x/lsp_signature.nvim", opts = {} },
			{
				"zeioth/none-ls-autoload.nvim",
				dependencies = {
					"williamboman/mason.nvim",
					"nvimtools/none-ls.nvim",
				},
				opts = {},
			},
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("<leader>ld", require("telescope.builtin").lsp_definitions, "goto definition")
					map("<leader>lD", vim.lsp.buf.declaration, "goto declaration")
					map("<leader>lr", require("telescope.builtin").lsp_references, "goto references")
					-- map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					-- map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "document symbols")
					map("<leader>lS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "workspace symbols")
					map("<leader>ln", vim.lsp.buf.rename, "rename")
					map("<leader>l.", vim.lsp.buf.code_action, "code action")

					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})

						vim.api.nvim_create_autocmd("LspDetach", {
							group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
							end,
						})
					end

					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>lh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
						end, "toggle inlay hints")
					end

					require("lsp_signature").on_attach({
						bind = true,
						handler_opts = {
							border = "rounded",
						},
					}, event.buf)
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
			}

			require("mason").setup()

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})

			require("mason-tool-installer").setup({
				ensure_installed = ensure_installed,
			})

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})

			-- vim.keymap.set("<leader>lk", function()
			-- 	require("lsp_signature").toggle_float_win()
			-- end, { desc = "toggle signature" })
			-- vim.keymap.set("<leader>lK", function()
			-- 	vim.lsp.buf.signature_help()
			-- end, { desc = "toggle signature" })
		end,
	},
}
