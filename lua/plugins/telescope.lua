return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local telescope = require('telescope')

        telescope.setup({
            file_ignore_patterns = { "node%_modules/.*", "%.git/.*" },
        })
        telescope.load_extension('harpoon')
        telescope.load_extension('projects')


        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pw', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pW', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
        vim.keymap.set('n', 'gr', builtin.lsp_references, {})
    end
}
