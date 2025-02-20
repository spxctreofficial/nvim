return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
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
        vim.keymap.set('n', '<leader>pc', function()
            builtin.colorscheme()
        end)
    end,
}
