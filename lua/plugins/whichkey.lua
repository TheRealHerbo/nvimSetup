return {
    {
        "folke/which-key.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        event = "VeryLazy",
        opts = {
            icons = {
                mappings = false,
                keys = {
                    Esc = "<esc>",
                    BS = "<bs>",
                    Space = "␣",
                },
            },
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.add({
                { "<leader><tab>", group = "tabs" },
                { "<leader>D",     group = "type_def" },
                { "<leader>a",     group = "add_harpoon" },
                { "<leader>b",     group = "buffer" },
                { "<leader>c",     group = "code" },
                { "<leader>f",     group = "format" },
                { "<leader>g",     group = "git" },
                { "<leader>gh",    group = "hunks" },
                { "<leader>h",     group = "harpoon" },
                { "<leader>n",     group = "comment" },
                { "<leader>p",     group = "fuzzy find" },
                { "<leader>q",     group = "quit/session" },
                { "<leader>r",     group = "rename" },
                { "<leader>s",     group = "search" },
                { "<leader>u",     group = "changes" },
                { "<leader>v",     group = "vim" },
                { "<leader>w",     group = "window" },
                { "<leader>l",     group = "workspace" },
                { "<leader>t",     group = "trouble" },
                { "[",             group = "prev" },
                { "]",             group = "next" },
                { "g",             group = "goto" },
                { "gs",            group = "surround" },
            })
        end,
    },
}
