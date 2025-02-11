return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {},
    config = function()
        require("lsp_signature").setup({
            bind = true,
            floating_window = false,
            handler_opts = {
                border = "rounded"
            },
            close_timeout = 4000, -- close floating window after ms when last parameter is entered
            fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
            hint_prefix = "🐼",
            vim.keymap.set({ 'n', 'i' }, '<C-t>', function()
                require('lsp_signature').toggle_float_win()
            end, { silent = true, noremap = true, desc = 'toggle signature' })
        })
    end
}
