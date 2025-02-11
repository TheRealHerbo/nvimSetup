return{
    {
        "github/copilot.vim",
        event = "VeryLazy",
        config = function()
            vim.g.copilot_enabled = 0  -- Disable Copilot by default
        end
    }
}
