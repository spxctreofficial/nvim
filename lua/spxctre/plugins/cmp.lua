return {
    "hrsh7th/nvim-cmp",     -- LSP autocompletion.
    dependencies = {
        -- Autocomplete sources
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "weilbith/nvim-code-action-menu",

        -- LSP Integration (Rust)
        "simrat39/rust-tools.nvim",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function(_, opts)
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        local cmp_mappings = {
            ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
            ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
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
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
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
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
        vim.diagnostic.config({
            update_in_insert = true,
        })

        local function lsp_attach(bufnr)
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover()
            end, opts)
            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, opts)
            vim.keymap.set("n", "gi", function()
                vim.lsp.buf.implementation()
            end, opts)
            vim.keymap.set("n", "gr", function()
                vim.lsp.buf.references()
            end, opts)
            vim.keymap.set("n", "<C-R>", function()
                vim.lsp.buf.rename()
            end, opts)
            vim.keymap.set("n", "<leader>j", function()
                vim.diagnostic.goto_next()
            end, opts)
            vim.keymap.set("n", "<leader>k", function()
                vim.diagnostic.goto_prev()
            end, opts)
            vim.keymap.set("n", "<C-.>", function()
                vim.cmd.CodeActionMenu()
            end, opts)
            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format()
                vim.diagnostic.enable(0)
            end, opts) -- Code formatting
        end
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                lsp_attach(args.buf) -- Key mappings when an LSP is attached to a buffer.
            end,
        })
    end
}
