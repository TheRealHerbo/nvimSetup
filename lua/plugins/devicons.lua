return {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
        require("nvim-web-devicons").setup {
            default = true,
            color_icons = true,
            strict = true,
            variant = "dark",
        }
    end,
}
