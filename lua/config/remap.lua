local keymap = vim.keymap

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- better escape
keymap.set('i', 'jj', '<ESC>')

-- enter in normal mode
keymap.set('n', '<Enter>', 'i<Enter><ESC>')

-- easy tab in normal/visual mode
keymap.set({ 'n', 'v' }, '<Tab>', '>><Esc>')
keymap.set({ 'n', 'v' }, '<S-Tab>', '<<<Esc>')

-- paste in insert mode
keymap.set('i', '<C-v>', '<C-r>+')

-- window navigation
keymap.set('n', '<leader>w', '<C-w>')
keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'vertical' })
keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'horizontal' })
keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'next' })
keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'close' })
keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'left' })
keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'down' })
keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'up' })
keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'right' })
keymap.set('n', '<M-h>', '<C-w>5<', { desc = 'size left' })
keymap.set('n', '<M-j>', '<C-w>5+', { desc = 'size add' })
keymap.set('n', '<M-k>', '<C-w>5-', { desc = 'size sub' })
keymap.set('n', '<M-l>', '<C-w>5>', { desc = 'size right' })

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
        keymap.set('n', '<space>la', vim.lsp.buf.add_workspace_folder, opts)
        keymap.set('n', '<space>lr', vim.lsp.buf.remove_workspace_folder, opts)
        keymap.set('n', '<space>ll', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- diagnostics
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'prev diagnostic' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'next diagnostic' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'open error message' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'open quickfix list' })

-- quickfix
keymap.set('n', '<C-j>', ':cnext<CR>', { desc = 'next quickfix' })
keymap.set('n', '<C-k>', ':cprev<CR>', { desc = 'prev quickfix' })

-- copilot
keymap.set('i', '<C-f>', 'copilot#Accept("\\<CR>")', {
    expr = true,
    replace_keycodes = false
})
keymap.set('i', '<C-Tab>', '<Plug>(copilot-accept-word)')
vim.g.copilot_no_tab_map = true

-- context of class or function
keymap.set('n', '<leader>cc', ':TSContextToggle<CR>')

-- dadbod
keymap.set('n', '<leader>dt', ':DBUIToggle<CR>')
keymap.set('n', '<leader>dc', ':DBUIAddConnection<CR>')

-- colorscheme
local themeChanged = false
local function toggle_color()
    if themeChanged then
        vim.cmd[[colorscheme tokyonight-storm]]
        themeChanged = false
        print('changed to tokyo')
    else
        vim.cmd[[colorscheme catppuccin-latte]]
        themeChanged = true
        print(themeChanged)
    end
end

keymap.set('n', '<leader>vc', toggle_color, { desc = 'toggle theme' })
