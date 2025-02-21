return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    config = function(_, opts)
        local builtin = require('telescope.builtin')

        local function clear()
            -- Force closes any other active floating window
            if vim.api.nvim_win_get_config(vim.api.nvim_get_current_win()).relative  ~= '' then vim.api.nvim_win_close(vim.api.nvim_get_current_win(), false) end
        end

        vim.keymap.set('n', '<leader>pf', function()
            clear()
            builtin.find_files()
        end, {})
        vim.keymap.set('n', '<C-p>', function()
            clear()
            builtin.find_files()
            vim.api.nvim_feedkeys('<Esc>', 'i', false)
        end, {})
        vim.keymap.set('n', '<leader>ps', function()
            clear()
            builtin.live_grep() -- requires ripgrep package to be installed, use `checkhealth telescope`
        end)
        vim.keymap.set('n', '<leader>pc', function()
            clear()
            builtin.colorscheme()
        end)
    end,
}
