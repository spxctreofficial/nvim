return {
    "goolord/alpha-nvim",
    -- lazy = false,
    event = "VimEnter",
    config = function(_, unused_opts)
        local alpha = require('alpha')

        local if_nil = vim.F.if_nil

        local default_terminal = {
            type = "terminal",
            command = nil,
            width = 69,
            height = 8,
            opts = {
                redraw = true,
                window_config = {},
            },
        }

        local default_header = {
            type = "text",
            val = {
                [[                               __]],
                [[  ___     ___    ___   __  __ /\_\    ___ ___]],
                [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
                [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
                [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
                [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
            },
            opts = {
                position = "center",
                hl = "@method",
                -- wrap = "overflow";
            },
        }

        local ahegao_header = {
            type = "text",
            val = {
                [[⣿⡇⠘⡇⢀⣶⣶⠄⠈⣾⡟⢂⣿⣿⣿⣿⣿⣿⡿⢉⢾⢃⣿⣿⡟⣸⢸⣿⣿⣸]],
                [[⣿⢸⣦⢧⢸⣿⣿⢱⠄⠄⣇⣼⣿⣿⣿⣿⣿⢟⣼⣿⡯⠸⣿⢳⢱⡏⣼⣿⢇⣿]],
                [[⡏⣾⢽⣼⢸⣿⣿⡘⣆⢀⠛⣿⣿⣿⣿⡿⣫⣾⣿⣿⢇⣿⠂⢌⡾⡇⣿⡿⢸⣿]],
                [[⢧⣿⠄⢹⢸⣿⣿⣷⣭⢸⡄⣿⣿⣿⢋⣵⣿⣿⡿⠟⡨⡡⠄⣾⣿⡆⣭⡇⣿⣿]],
                [[⣼⡏⡀⠄⢀⢿⣿⣿⡟⣾⡇⣿⡿⣡⢁⣿⣿⣫⡶⢃⡵⣡⣿⣮⡻⡇⣿⢸⣮⢿]],
                [[⣿⡇⣧⢠⠸⡎⡍⡭⢾⡏⣧⢋⢾⠏⣼⣿⣿⠿⣵⣾⣕⠿⣿⣿⣷⢡⠏⣾⣿⣿]],
                [[⣿⠁⣿⠈⠄⠄⢃⢹⡀⠸⢸⢿⠸⢰⢻⢿⣟⢁⣀⠄⠄⠉⠒⢝⢿⠸⣴⣿⣿⣿]],
                [[⡍⠇⣿⣷⢰⢰⢸⠄⡃⡆⠈⠈⡀⡌⠠⠸⠃⣿⣏⡳⢷⢄⡀⠄⠄⠰⣿⣿⣿⣿]],
                [[⡇⠄⠸⣿⢸⣿⣶⡄⣇⠃⡇⡄⡇⠁⠃⠄⠈⢊⠻⠿⣿⣿⣿⣦⠄⠘⣿⣿⣿⣿]],
                [[⡇⠄⠄⢻⣸⣿⣿⠏⡙⢸⣇⣡⢰⢀⠄⠄⠄⠈⡁⢱⢈⢿⣿⡿⡄⣰⣶⣿⣿⣿]],
                [[⡇⠄⠄⠄⢻⣿⡿⢰⡇⠆⠲⠶⣝⠾⠸⢴⢠⠄⠇⢸⢸⠄⡶⡜⣽⣿⣿⣿⣿⢏]],
                [[⠁⠄⠄⠄⠄⢿⡇⠧⢣⣸⣦⣄⣀⠁⠓⢸⣄⠸⢀⠄⡀⡀⡪⣽⣿⣿⢿⣿⢟⣬]],
                [[⠄⠄⠄⠄⠄⠈⢧⠯⢸⣿⣿⣿⡿⠰⣷⠄⣿⣇⡿⠄⡀⠦⣰⣿⡿⣱⣿⡏⢾⣫]],
                [[⠄⠄⠄⠄⠄⠄⠈⣌⢌⢿⣿⣿⠇⠼⢃⢠⢇⣻⣧⣿⡡⣸⣿⠿⢁⡟⢁⣳⣿⣿]],
                [[⠄⠄⠄⠄⠄⠄⠄⠄⠳⢝⣒⣒⠰⣘⣴⡧⠿⣿⣛⡯⣱⡿⣫⢎⣪⣎⣿⣧⢻⠿]],
            },
            opts = {
                position = "center",
                hl = "@method",
                -- wrap = "overflow";
            },
        }

        local footer = {
            type = "text",
            val = "i love big titty goth girls",
            opts = {
                position = "center",
                hl = "Question",
            },
        }

        --- @param sc string
        --- @param txt string
        --- @param keybind string? optional
        --- @param keybind_opts table? optional
        local function button(sc, txt, keybind, keybind_opts)
            local opts = {
                position = "center",
                shortcut = sc,
                cursor = 3,
                width = 50,
                hl = "@Define",
                align_shortcut = "right",
                hl_shortcut = "ErrorMsg",
            }
            if keybind then
                keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
                opts.keymap = { "n", sc, keybind, keybind_opts }
            end

            local function on_press()
                local key = vim.api.nvim_replace_termcodes(keybind or sc .. "<Ignore>", true, false, true)
                vim.api.nvim_feedkeys(key, "t", false)
            end

            return {
                type = "button",
                val = txt,
                on_press = on_press,
                opts = opts,
            }
        end

        local buttons = {
            type = "group",
            val = {
                -- button("e", "  New file", "<cmd>ene <CR>"),
                button("<leader>pv", "  netrw - File Explorer"),
                button("<leader>pf", "󰈞  Telescope - Find Files"),
                -- button("SPC f h", "󰊄  Recently opened files"),
                -- button("SPC f r", "  Frecency/MRU"),
                button("<leader>ps", "󰈬  Telescope - Live Grep"),
                -- button("SPC f m", "  Jump to bookmarks"),
                -- button("SPC s l", "  Open last session"),
            },
            opts = {
                spacing = 1,
            },
        }

        local section = {
            header   = default_header,
            terminal = default_terminal,
            art      = ahegao_header,
            buttons  = buttons,
            footer   = footer,
        }

        local config = {
            layout = {
                { type = "padding", val = 2 },
                section.header,
                { type = "padding", val = 2 },
                section.buttons,
                { type = "padding", val = 5 },
                section.art,
                { type = "padding", val = 2 },
                section.footer,
            },
            opts = {
                margin = 5,
            },
        }

        alpha.setup(config)

        -- Keybindings to switch to and from netrw
        vim.api.nvim_create_autocmd({ 'BufEnter', 'filetype' }, {
            pattern = 'netrw',
            callback = function(args)
                local function quit()
                    vim.cmd.bd(args.buf)
                    vim.cmd.Alpha()
                end
                local opts = { buffer = args.buf, remap = false }

                vim.keymap.set('n', '<Esc>', quit, opts)
                vim.keymap.set('n', '<F13>', quit, opts)
                vim.keymap.set('n', '<leader>q', quit, opts)
            end
        })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'filetype' }, {
            pattern  = 'alpha',
            callback = function(args)
                local function enter()
                    vim.cmd.bd(args.buf)
                    vim.cmd.Ex()
                end
                local opts = { buffer = args.buf, remap = false }

                vim.keymap.set({ 'n', 't' }, '<leader>pv', enter, opts)
            end
        })
    end
}
