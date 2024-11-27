local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function ()
        vim.highlight.on_yank()
    end,
})

api.nvim_create_autocmd({ "BufWritePre" }, {
    desc = "Remove trailing whitespace",
    group = api.nvim_create_augroup("remove-trailing-whitespace", { clear = true }),
    pattern = "*",
    callback = function ()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})


