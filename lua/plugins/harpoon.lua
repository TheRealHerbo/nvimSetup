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
            vim.keymap.set("n", "<C-y>", function() harpoon:list():select(1) end, {desc = "go 1"})
            vim.keymap.set("n", "<C-u>", function() harpoon:list():select(2) end, {desc = "go 2"})
            vim.keymap.set("n", "<C-o>", function() harpoon:list():select(3) end, {desc = "go 3"})
            vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end, {desc = "go 4"})
        end
    }
}
