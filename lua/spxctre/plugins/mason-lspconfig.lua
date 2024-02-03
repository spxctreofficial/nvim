return {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = {
            handlers = {
                function(server_name) -- Automatically sets up LSP language servers with autocomplete support.
                    lsp[server_name].setup({
                        capabilities = cmp_capabilities,
                    })
                end,
                ["rust_analyzer"] = function()
                    require("rust-tools").setup({})
                end,
                ["jdtls"] = function()
                    lsp.jdtls.setup({})
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
        },
        config = true,
}
