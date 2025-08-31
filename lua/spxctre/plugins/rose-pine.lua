return {
    "rose-pine/neovim", -- uwu
    name = "rose-pine",
    priority = 1000,
    event = "UIEnter",
    opts = {
        variant = "main",      -- auto, main, moon, or dawn
        dark_variant = "main", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
            terminal = true,
            legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
            migrations = true,        -- Handle deprecated options automatically
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

        local color = require('spxctre.color')

        -- palette ripped straight from require('rose-pine.palette') since it is not exposed
        local variants = {
            main = {
                _nc = "#16141f",
                base = "#191724",
                surface = "#1f1d2e",
                overlay = "#26233a",
                muted = "#6e6a86",
                subtle = "#908caa",
                text = "#e0def4",
                love = "#eb6f92",
                gold = "#f6c177",
                rose = "#ebbcba",
                pine = "#31748f",
                foam = "#9ccfd8",
                iris = "#c4a7e7",
                leaf = "#95b1ac",
                highlight_low = "#21202e",
                highlight_med = "#403d52",
                highlight_high = "#524f67",
                none = "NONE",
            },
            moon = {
                _nc = "#1f1d30",
                base = "#232136",
                surface = "#2a273f",
                overlay = "#393552",
                muted = "#6e6a86",
                subtle = "#908caa",
                text = "#e0def4",
                love = "#eb6f92",
                gold = "#f6c177",
                rose = "#ea9a97",
                pine = "#3e8fb0",
                foam = "#9ccfd8",
                iris = "#c4a7e7",
                leaf = "#95b1ac",
                highlight_low = "#2a283e",
                highlight_med = "#44415a",
                highlight_high = "#56526e",
                none = "NONE",
            },
            dawn = {
                _nc = "#f8f0e7",
                base = "#faf4ed",
                surface = "#fffaf3",
                overlay = "#f2e9e1",
                muted = "#9893a5",
                subtle = "#797593",
                text = "#464261",
                love = "#b4637a",
                gold = "#ea9d34",
                rose = "#d7827e",
                pine = "#286983",
                foam = "#56949f",
                iris = "#907aa9",
                leaf = "#6d8f89",
                highlight_low = "#f4ede8",
                highlight_med = "#dfdad9",
                highlight_high = "#cecacd",
                none = "NONE",
            },
        }

        color.colorscheme_hl_groups['rose-pine-main'] = {
            {
                groups = { 'Comment', '@property', '@variable', '@variable.parameter', '@variable.builtin', '@variable.parameter.builtin', '@parameter', '@lsp' },
                opts = {
                    italic = false,
                },
            },
            {
                groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder' },
                opts = {
                    bg = variants.main.base
                },
            },
        }
        color.colorscheme_hl_groups['rose-pine-moon'] = {
            {
                groups = { 'Comment', '@property', '@variable', '@variable.parameter', '@variable.builtin', '@variable.parameter.builtin', '@parameter', '@lsp' },
                opts = {
                    italic = false,
                },
            },
            {
                groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder' },
                opts = {
                    bg = variants.moon.base
                },
            },
        }
        color.colorscheme_hl_groups['rose-pine-dawn'] = {
            {
                groups = { 'Comment', '@property', '@variable', '@variable.parameter', '@variable.builtin', '@variable.parameter.builtin', '@parameter', '@lsp' },
                opts = {
                    italic = false,
                },
            },
            {
                groups = { 'NormalFloat', 'FloatBorder', 'FloatTitle', 'TelescopeBorder', 'BlinkCmpMenu', 'BlinkCmpMenuBorder', 'LspFloatWinNormal', 'LspFloatWinBorder' },
                opts = {
                    bg = variants.dawn.base
                },
            },
        }

        table.insert(color.installed, 'rose-pine')
    end
}
