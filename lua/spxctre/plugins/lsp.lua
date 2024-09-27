return {
    "neovim/nvim-lspconfig", -- LSP Support
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "simrat39/rust-tools.nvim",
        "folke/neodev.nvim",
        "mfussenegger/nvim-jdtls",
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function(_, opts)
        local lsp = require('lspconfig')
        local mlsp = require('mason-lspconfig')

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
                border = "rounded"
            }
        )
        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
                border = "rounded"
            }
        )
        vim.diagnostic.config({
            float = {
                border = "rounded"
            }
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "java",
            callback = function()
                local jdtls = require('jdtls')

                local config = {
                    cmd = { 'jdtls' },
                    root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
                }
                jdtls.start_or_attach(config)
            end
        })
        mlsp.setup({
            ensure_installed = {
                "rust_analyzer",
                "lua_ls",
                -- "jdtls",
            },
            handlers = {
                function(server_name) -- Automatically sets up LSP language servers with autocomplete support.
                    lsp[server_name].setup({
                        capabilities = require('cmp_nvim_lsp').cmp_capabilities,
                    })
                end,
                ['rust_analyzer'] = function()
                    require('rust-tools').setup()
                end,
                -- ["html"] = function()
                --     lsp["html"].setup({
                --         filetypes = {
                --             "html",
                --             "javascript",
                --             "javascriptreact",
                --             "typescript",
                --             "typescriptreact",
                --             "svelte",
                --             "vue",
                --             "rust",
                --         },
                --         init_options = {
                --             userLanguages = {
                --                 rust = "html",
                --             },
                --         },
                --     })
                -- end,
            },
        })
        local function lsp_attach(bufnr)
            local builtin = require('telescope.builtin')
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover()
            end, opts)
            vim.keymap.set("n", "gd", function()
                builtin.lsp_definitions({ jump_type = "never" })
            end, opts)
            vim.keymap.set("n", "gi", function()
                builtin.lsp_implementation({ jump_type = "never" })
            end, opts)
            vim.keymap.set("n", "gr", function()
                builtin.lsp_references({ jump_type = "never" })
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
            vim.keymap.set("n", "<leader>.", function()
                builtin.quickfix()
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
