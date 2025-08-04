return {
    "rose-pine/neovim", -- uwu
    name = "rose-pine",
    priority = 1000,
    event = "UIEnter",
    opts = {
        variant = "auto",  -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
            terminal = true,
            legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
            migrations = true,    -- Handle deprecated options automatically
        },

        styles = {
            bold = true,
            italic = true,
            transparency = false,
        },

        groups = {
            border = "muted",
            link = "iris",
            panel = "surface",

            error = "love",
            hint = "iris",
            info = "foam",
            note = "pine",
            todo = "rose",
            warn = "gold",

            git_add = "foam",
            git_change = "rose",
            git_delete = "love",
            git_dirty = "rose",
            git_ignore = "muted",
            git_merge = "iris",
            git_rename = "pine",
            git_stage = "iris",
            git_text = "rose",
            git_untracked = "subtle",

            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
        },

        palette = {
            -- Override the builtin palette per variant
            -- moon = {
            --     base = '#18191a',
            --     overlay = '#363738',
            -- },
        },

        highlight_groups = {
            -- use config its better trust
        },

        before_highlight = function(group, highlight, palette)
            -- Disable all undercurls
            -- if highlight.undercurl then
            --     highlight.undercurl = false
            -- end
            --
            -- Change palette colour
            -- if highlight.fg == palette.pine then
            --     highlight.fg = palette.foam
            -- end
        end,
    },
    config = function(_, opts)
        require('rose-pine').setup(opts)

        local palette = require('rose-pine.palette')
        local color = require('spxctre.color')

        local hl_groups = {
            {
                groups = { 'Comment', '@property', '@variable', '@variable.parameter', '@variable.builtin', '@variable.parameter.builtin', '@parameter', '@lsp' },
                opts = {
                    italic = false,
                },
            },
            {
                groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder' },
                opts = {
                    bg = palette.base
                },
            },
        }

        color.colorscheme_hl_groups['rose-pine-main'] = hl_groups

        color.set('rose-pine', hl_groups)
    end
}
