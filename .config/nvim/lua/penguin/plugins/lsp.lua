-- LSP Configuration & Plugins

return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'WhoIsSethDaniel/mason-tool-installer.nvim',

		'nvim-telescope/telescope.nvim',
		'hrsh7th/cmp-nvim-lsp',
		{ 'j-hui/fidget.nvim', opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
			callback = function(event)
				local set = function(keys, fun, desc)
					vim.keymap.set('n', keys, fun, { buffer = event.buf, desc = '' .. desc })
				end
				-- local require('telescope.builtin') = require('telescope.builtin')

				-- To jump back, press <C-T>.
				set('gd', require('telescope.builtin').lsp_definitions, 'Go to definition')
				set('<leader>cd', require('telescope.builtin').lsp_definitions, 'Go to definition (gd)')
				-- --set('n', 'gD', require('telescope.builtin').lsp_type_definitions, 'Go to type definition')
				set('<leader>cD', require('telescope.builtin').lsp_type_definitions, 'Go to type definition')
				set('gD', vim.lsp.buf.declaration, 'Go to declaration/header file')
				set('<leader>ch', vim.lsp.buf.declaration, 'Go to declaration/header file (gD)')
				set('gr', require('telescope.builtin').lsp_references, 'Go to references')
				set('gI', require('telescope.builtin').lsp_implementations, 'Go to implementation')

				set('<leader>cs', require('telescope.builtin').lsp_document_symbols, 'List LSP document symbols')
				set(
					'<leader>cS',
					require('telescope.builtin').lsp_dynamic_workspace_symbols,
					'List LSP project symbols'
				)

				set('<leader>ca', vim.lsp.buf.code_action, 'Code action')
				set('<C-.>', vim.lsp.buf.code_action, 'Code action')
				set('<leader>cr', vim.lsp.buf.rename, 'Rename symbol')
				set('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')

				set('<leader>ck', vim.lsp.buf.hover, 'Hover documentation (K)')
				set('K', vim.lsp.buf.hover, 'Hover documentation')

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				-- local client = vim.lsp.get_client_by_id(event.data.client_id)
				-- if client and client.server_capabilities.documentHighlightProvider then
				-- 	vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				-- 		buffer = event.buf,
				-- 		callback = vim.lsp.buf.document_highlight,
				-- 	})
				--
				-- 	vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				-- 		buffer = event.buf,
				-- 		callback = vim.lsp.buf.clear_references,
				-- 	})
				-- end
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

		local util = require('lspconfig/util')
		local servers = {
			-- clangd = {},
			-- gopls = {},
			pyright = {},
			rust_analyzer = {
				filetypes = { 'rust' },
				root_dir = util.root_pattern('Cargo.toml'),
				settings = {
					rust_analyzer = {
						cargo = {
							allFeatures = true,
						},
						diagnostics = {
							enable = true,
							experimental = {
								enable = true,
							},
						},
					},
				},
			},
			ts_ls = {},
			stylua = {},
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = 'LuaJIT' },
						workspace = {
							checkThirdParty = false,
							library = {
								'${3rd}/luv/library',
								unpack(vim.api.nvim_get_runtime_file('', true)),
							},
							-- If lua_ls is really slow on your computer, you can try this instead:
							-- library = { vim.env.VIMRUNTIME },
						},
						completion = {
							callSnippet = 'Replace',
						},
						diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
		}

		require('mason').setup({
			ui = {
				border = 'single',
			},
		})

		require('mason-tool-installer').setup({ ensure_installed = servers })

		require('mason-lspconfig').setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
					require('lspconfig')[server_name].setup(server)
				end,
			},
		})
	end,
}
