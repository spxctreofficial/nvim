return {
    'MeanderingProgrammer/render-markdown.nvim',
    event = "VeryLazy",
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        completions = {
            blink = {
                enabled = true,
            },
        },
        overrides = {
            buflisted = {},
            buftype = {
                nofile = {
                    code = {
                        highlight = 'NormalFloat',
                        highlight_border = 'FloatBorder',
                    }
                }
            }
        }
    },
    config = function(_, opts)
        require('render-markdown').setup(opts)
    end
}
