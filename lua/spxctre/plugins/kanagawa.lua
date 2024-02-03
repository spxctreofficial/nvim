return {
    "rebelot/kanagawa.nvim",
    enabled = false,
    opts = {
        compile = false, -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {         -- add/modify theme and palette colors
            palette = {},
            theme = {
                wave = {},
                lotus = {},
                dragon = {
                    syn = {
                        fun = "#E6C384",
                        string = "#a292a3",
                        special1 = "none",
                    },
                },
                all = {},
            },
        },
        overrides = function(colors) -- add/modify highlights
            return {}
        end,
        theme = "wave",  -- Load "wave" theme when 'background' option is not set
        background = {   -- map the value of 'background' option to a theme
            dark = "dragon", -- try "dragon" !
            light = "lotus",
        },
    },
    config = true
}
