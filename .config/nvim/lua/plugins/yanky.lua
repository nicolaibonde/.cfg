return {
	"gbprod/yanky.nvim",
	dependencies = { { "kkharji/sqlite.lua", enabled = not jit.os:find("Windows") } },
	opts = {
		highlight = {
			on_put = true,
			on_yank = true,
			timer = 300,
		},
		ring = { storage = jit.os:find("Windows") and "shada" or "sqlite" },
	},
	keys = {
		{
			"<leader>p",
			function()
				require("telescope").extensions.yank_history.yank_history({})
			end,
			desc = "Open Yank History",
		},
		{
			"y",
			"<Plug>(YankyYank)",
			mode = { "n", "x" },
			desc = "Yank text",
		},
		{
			"p",
			"<Plug>(YankyPutAfter)",
			mode = { "n", "x" },
			desc = "Put yanked text after cursor",
		},
		{
			"P",
			"<Plug>(YankyPutBefore)",
			mode = { "n", "x" },
			desc = "Put yanked text before cursor",
		},
	},
}
