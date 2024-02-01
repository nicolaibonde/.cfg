return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    init = function()
        vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<CR>", { desc = "Open Explorer" })
    end,
    opts = {
        filesystem = {
            window = {
                position = "current",
            },
            hijack_netrw_behavior = "open_default",
        },
    },
}
return {
    "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                        "MunifTanjim/nui.nvim",
                            },
                                init = function()
                                        vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle left<CR>", { desc = "Open Explorer" })
    end,
        opts = {
            filesystem = {
                    window = {
                position = "current",
            },
            hijack_netrw_behavior = "open_default",
        },
builtin},
}


