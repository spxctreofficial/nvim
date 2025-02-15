return {
    "iguanacucumber/magazine.nvim",     -- LSP autocompletion.
    name = "nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter", }, -- load cmp when typing
    dependencies = {
        -- Autocomplete sources
        { "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
        { "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
        { "iguanacucumber/mag-buffer", name = "cmp-buffer" },
        { "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },

        "https://codeberg.org/FelipeLema/cmp-async-path", -- not by me, but better than cmp-path
    },
    config = function(_, opts)
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local cmp_mappings = {
            ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<C-n>"] = cmp.mapping.abort(),
            ["<C-Space>"] = cmp.mapping.complete(),
        }

        -- Use Neovim's built-in LSP and buffer source for autocomplete.
        ---@diagnostic disable-next-line: missing-fields
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            performance = {
                debounce = 10,
            },

            mapping = cmp_mappings,
            sources = {
                { name = "nvim_lsp" },
                { name = "buffer" },
            },
        })
        -- Use buffer source for `/` and `?` autocomplete.
        ---@diagnostic disable-next-line: missing-fields
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp_mappings,
            sources = {
                { name = "buffer" },
            },
        })
        -- Use cmdline & path source for ':' autocomplete.
        ---@diagnostic disable-next-line: missing-fields
        cmp.setup.cmdline(":", {
            mapping = cmp_mappings,
            sources = cmp.config.sources({
                { name = "async_path" },
            }, {
                {
                    name = "cmdline",
                    keyword_pattern = [[\!\@<!\w*]]     -- Keyword pattern prevents hanging when autocompleting words starting with #!
                },
            }),
        })
        vim.diagnostic.config({
            update_in_insert = true,
        })

    end
}
