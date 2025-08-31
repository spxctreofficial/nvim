vim.api.nvim_create_autocmd({ 'filetype' }, {
    pattern = { "alpha" },
    callback = function()
        vim.opt.laststatus = 0

        vim.api.nvim_create_autocmd({ 'BufUnload', }, {
            callback = function()
                vim.opt.laststatus = 2
            end
        })
    end
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == "help" then vim.cmd.wincmd("L") end
    end
})

vim.api.nvim_create_autocmd('filetype', {
    pattern = require("spxctre.plugins.treesitter").opts.parsers,
    callback = function()
        vim.treesitter.start()
    end,
})
