return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"cmake",
					"pyright",
					"ruff-lsp",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--std=c++20",
					"--offset-encoding=utf-16",
                    "--query-driver=/home/nkb/.espressif/tools/xtensa-esp-elf/esp-13.2.0_20230928/xtensa-esp-elf/bin/xtensa-esp32s3-elf-gcc" ,
				},
			})

			lspconfig.cmake.setup({
				capabilities = capabilities,
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
				keys = {
					"<leader>co",
					function()
						vim.lsp.buf.code_action({
							apply = true,
							context = {
								only = { "source.organizeImports" },
								diagnostics = {},
							},
						})
					end,
					desc = "Organize Imports",
				},
			})

			local wt = require("which-key")

			wt.register({
				g = {
					d = { vim.lsp.buf.definition, "Go to definition" },
					D = { vim.lsp.buf.declaration, "Go to declaration" },
					K = { vim.lsp.buf.hover, "Show documentation" },
				},
			}, {})

			wt.register({
				c = {
					name = "code",
					a = { vim.lsp.buf.code_action, "Show code actions" },
					f = { vim.lsp.buf.format, "Format code" },
					r = { vim.lsp.buf.rename, "Rename" },
				},
			}, { prefix = "<Leader>" })
		end,
	},
}
