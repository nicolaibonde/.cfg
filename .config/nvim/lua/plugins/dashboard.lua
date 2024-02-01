return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                          nkb@mjolner.dk                               ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <CR>"),
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files<cr>"),
			dashboard.button("h", "󰊄  Recently opened files", ":Telescope oldfiles<cr>"),
			-- dashboard.button("r", "  Frecency/MRU"),
			dashboard.button("g", "󰈬  Find word", ":Telescope live_grep<cr>"),
			-- dashboard.button(" f m", "  Jump to bookmarks"),
			dashboard.button("s", "  Open last session", [[:lua require("persistence").load({ last = true })<cr>]]),
		}
		alpha.setup(dashboard.opts)
	end,
}
