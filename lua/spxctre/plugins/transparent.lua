return {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    opts = {       -- Optional, you don't have to run setup.
        groups = { -- table: default groups
            'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
            'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
            'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
            'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
            'EndOfBuffer',
        },
        extra_groups = {
            'NormalFloat', 'FloatBorder',
        },                   -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
    },
    config = function(_, opts)
        require("transparent").setup(opts)
        require("transparent").clear_prefix('lualine')
    end
}
