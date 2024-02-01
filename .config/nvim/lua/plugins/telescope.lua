return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            local wt = require("which-key")

            wt.register({
                f = {
                    name = "file",
                    f = { builtin.find_files, "Find File" },
                    g = { builtin.live_grep, "Live Grep" },
                },
                ["<Space>"] = { builtin.find_files, "Find File" },
            }, { prefix = "<leader>" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({
                            -- even more opts
                        }),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
