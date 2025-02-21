return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
    opts = {
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    },
    config = function(_, opts)
        local harpoon = require('harpoon')
        harpoon:setup(opts)

        local toggle_opts = {
            border = "rounded",
            title_pos = "center",
            ui_width_ratio = 0.40,
        }

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-E>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end)
    end

}
