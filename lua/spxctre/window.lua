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

local M = {}

function M.clear()
    -- Force closes any other active floating window
    if vim.api.nvim_win_get_config(vim.api.nvim_get_current_win()).relative ~= '' then
        vim.api.nvim_win_close(
            vim.api.nvim_get_current_win(), false)
    end
end

return M
