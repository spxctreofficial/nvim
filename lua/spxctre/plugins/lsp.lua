return {
    "neovim/nvim-lspconfig", -- LSP Support
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "simrat39/rust-tools.nvim",
        "mfussenegger/nvim-jdtls",
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function(_, opts)
        local lsp = require('lspconfig')
        local mlsp = require('mason-lspconfig')
        local cmp_lsp = require('cmp_nvim_lsp')

        local capabilities  = cmp_lsp.default_capabilities()

        -- Theming
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

        -- Language Servers
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
        lsp.rust_analyzer.setup {
            capabilities = capabilities,
        }
        -- lsp.ts_ls.setup {
        --     filetypes = {
        --         'javascript',
        --         'typescript',
        --         'javascriptreact',
        --         'typescriptreact',
        --     },
        --     capabilities = capabilities,
        -- }
        lsp.volar.setup {
            filetypes = {
                'typescript',
                'javascript',
                'javascriptreact',
                'typescriptreact',
                'vue',
            },
            init_options = {
                vue = {
                    hybridMode = false,
                },
            },
            capabilities = capabilities,
        }
        lsp.eslint.setup {
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
            capabilities = capabilities,
        }
        lsp.tailwindcss.setup {
            capabilities = capabilities
        }

        lsp.clangd.setup {
            capabilities = capabilities,
        }

        lsp.lua_ls.setup {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server the version of Lua you're using
                        -- This is most likely LuaJIT for Neovim config
                        version = 'LuaJIT'
                    },
                    -- Make the server aware of Neovim runtime filetypes
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            -- Depending on the usage, you might want to add additional paths here
                        }
                    },
                })
            end,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            },
            capabilities = capabilities
        }

        mlsp.setup({
            ensure_installed = {
                "rust_analyzer",
                "lua_ls",
                "volar",
                "eslint",
                -- "jdtls",
            },
            handlers = {
            },
        })

        -- On Attach LSP bindings
        local function lsp_attach(bufnr)
            local builtin = require('telescope.builtin')
            local opts = { buffer = bufnr, remap = false }
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover()
            end, opts)
            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
                -- builtin.lsp_definitions({ jump_type = "never" })
            end, opts)
            vim.keymap.set("n", "gi", function()
                vim.lsp.buf.implementation()
                -- builtin.lsp_implementation({ jump_type = "never" })
            end, opts)
            vim.keymap.set("n", "gr", function()
                vim.lsp.buf.references()
                -- builtin.lsp_references({ jump_type = "never" })
            end, opts)
            vim.keymap.set("n", "<leader>r", function()
                return ":IncRename " .. vim.fn.expand("<cword>")
            end, { buffer = bufnr, remap = false, expr = true })
            vim.keymap.set("n", "<leader>j", function()
                vim.diagnostic.goto_next()
            end, opts)
            vim.keymap.set("n", "<leader>k", function()
                vim.diagnostic.goto_prev()
            end, opts)
            vim.keymap.set("n", "<leader>.", function()
                vim.lsp.buf.code_action()
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
