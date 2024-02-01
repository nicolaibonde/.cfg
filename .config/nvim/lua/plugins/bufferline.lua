return {
	"akinsho/bufferline.nvim",
	init = function()
		local wt = require("which-key")
		wt.register({
			b = {
				name = "buffer",

				l = { ":BufferLineCloseLeft<CR>", "Close left" },
				r = { ":BufferLineCloseRight<CR>", "Close right" },
				o = { ":BufferLineCloseOthers<CR>", "Close others" },
				p = { ":BufferLineTogglePin<CR>", "Toggle pin buffer" },
				d = { ":bd<CR>", "Close current buffer" },
			},
		}, { prefix = "<Leader>" })

		wt.register({
			H = { ":bprev<CR>", "Previous buffer" },
			L = { ":bnext<CR>", "Next buffer" },
		})
	end,
	opts = {
		options = {
			close_command = function(n)
				require("mini.bufremove").delete(n, false)
			end,
			diagnostics = "nvim_lsp",
			always_show_bufferline = false,
			offsets = {
				{
					filetype = "neo-tree",
					text = "Explorer",
					hightlight = "Directory",
					text_align = "center",
				},
			},
		},
	},
}
