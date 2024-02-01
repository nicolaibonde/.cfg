return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		size = 20,
		open_mapping = "<c-k>",
		hide_numbers = true,
		direction = "horizontal",
		close_on_exit = true,
		auto_scroll = true,
		shell = vim.o.shell,
	},
	init = function()
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
            direction = "float",
		})

		function _LAZYGIT_TOGGLE()
			lazygit:toggle()
		end
        
        local wt = require("which-key")

        wt.register({
            g = {
                name = "git",
                g = {":lua _LAZYGIT_TOGGLE()<cr>","Open Lazygit"},
            }
        },{prefix="<leader>"})

	end,
}
