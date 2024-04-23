return {
    "neovim/nvim-lspconfig", -- LSP Support
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "simrat39/rust-tools.nvim",
        "folke/neodev.nvim",
        "mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function(_, opts)
        local lsp = require('lspconfig')
        local mlsp = require('mason-lspconfig')
        mlsp.setup({
            ensure_installed = {
                "rust_analyzer",
                "clangd",
                "clang-format",
                "lua_ls",
                "jdtls",
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
                ['jdtls'] = function()
                    lsp.jdtls.setup({
                        capabilities = require('cmp_nvim_lsp').cmp_capabilities,
                    })
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
    end
}
