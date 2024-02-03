return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    opts = {
        global_settings = {
            save_on_toggle = true,
            save_on_change = true,
            excluded_filetypes = { "harpoon" },
            mark_branch = false,
            tabline = false,
        },
        menu = {
            width = vim.api.nvim_win_get_width(0) - 20,
        }
    },
    config = function(_, opts)
        local harpoon = require('harpoon')
        harpoon.setup(opts)

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    end

}
