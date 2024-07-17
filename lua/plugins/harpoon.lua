return {
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, {desc = "add to list"})
            vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "toggle menu"})
            vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end, {desc = "clear list"})
        end
    }
}
