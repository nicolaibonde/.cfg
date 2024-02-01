return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function ()
        local wt = require("which-key")
        wt.register({
            c = {
                x = { ":TroubleToggle<cr>", "Show problems"},
            }

        },{prefix="<Leader>"})
    end,
    opts = {
    },
}
