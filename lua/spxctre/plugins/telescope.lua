return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function(_, opts)
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', function()
            builtin.find_files()
            vim.api.nvim_feedkeys('<Esc>', 'i', false)
        end, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.live_grep() -- requires ripgrep package to be installed, use `checkhealth telescope`
        end)
    end,
}
