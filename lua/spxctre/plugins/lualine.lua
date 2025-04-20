return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            lazy = true,
        },
    },
    event = "VeryLazy",
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = {
                'netrw',
                'alpha',
                statusline = {},
                winbar = {},

            },
            ignore_focus = {},
            always_divide_middle = true,
            always_show_tabline = true,
            globalstatus = false,
            refresh = {
                statusline = 10,
                tabline = 10,
                winbar = 10,
            }
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = { 'encoding', 'fileformat', 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { 'filename' },
            lualine_x = { 'location' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { 'oil', 'lazy' }
    },
    config = function(_, opts)
        require('lualine').setup(opts)
        vim.opt.showmode = false
        vim.opt.laststatus = 2
    end,
}
