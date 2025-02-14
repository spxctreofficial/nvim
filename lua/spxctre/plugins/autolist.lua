return {
    "gaoDean/autolist.nvim", -- Autocomplete lists
    ft = {
        "markdown",
        "text",
        "tex",
        "plaintex",
        "norg",
    },
    event = "VeryLazy",
    config = function()
        require("autolist").setup()

        local function bind_keys(bufnr)
            local opts = { buffer = bufnr, remap = false }

            vim.keymap.set('i', '<tab>', '<cmd>AutolistTab<cr>', opts)
            vim.keymap.set('i', '<s-tab>', '<cmd>AutolistShiftTab<cr>', opts)
            vim.keymap.set('i', '<CR>', '<CR><cmd>AutolistNewBullet<cr>', opts)

            vim.keymap.set('n', 'o', 'o<cmd>AutolistNewBullet<cr>', opts)
            vim.keymap.set('n', 'O', 'O<cmd>AutolistNewBulletBefore<cr>', opts)
            vim.keymap.set('n', '<CR>', '<cmd>AutolistToggleCheckbox<cr>j', opts)
            vim.keymap.set('n', '<S-CR>', '<cmd>AutolistToggleCheckbox<cr>k', opts)
            -- vim.keymap.set('n', '<C-r>', '<cmd>AutolistRecalculate<cr>', opts)
        end
        vim.api.nvim_create_autocmd('BufEnter', {
            pattern = { '*.md', '*.txt' },
            callback = function(args)
                bind_keys(args.buf) -- Key mappings when an LSP is attached to a buffer.
            end
        })
    end
}
