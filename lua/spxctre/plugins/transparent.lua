return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    enabled = false,
    opts = function()
        return {
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
    }
    end,
    config = function(_, opts)
        require("transparent").setup(opts)
        -- require("transparent").clear_prefix('lualine')
        -- Allows for transparency with lualine (experimental)

        if not vim.g.neovide then
            vim.g.transparent_enabled = true
        end
    end
}
