return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",         -- LSP integration for mason.nvim
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- Mason installer
    },
    event = "VeryLazy",
    opts = {
        ensure_installed = {
            "rust_analyzer",
            "clangd",
            "clang-format",
            "lua_ls",
            "jdtls",
            "omnisharp",
        },
        ui = {
            border = "rounded",
        }
    },
    config = true
}
