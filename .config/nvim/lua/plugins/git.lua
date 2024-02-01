return {
	{
		"tpope/vim-fugitive",
		config = function() end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					delete = { text = "" },
					topdelete = { text = "" },
				},
				current_line_blame = true,
				current_line_blame_opts = {
					delay = 150,
				},
				current_line_blame_formatter = "<author, <author_time:%d-%m-%Y> - <summary>",
			})

			local wt = require("which-key")

			function _TOGGLE_BLAME() 


            end

			wt.register({
				g = {
					p = { ":Gitsigns preview_hunk<cr>", "Git preview" },
					t = { ":Gitsigns toggle_current_line_blame<cr>", "Toggle line blame" },
				},
			}, { prefix = "<leader>" })
		end,
	},
}
