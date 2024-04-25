return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
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

        -- Telescope UI setup with Harpoon
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, {
        desc = "Open Harpoon UI"
    })
    end

}
