return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",         -- LSP integration for mason.nvim
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- Mason installer
    },
    event = "VeryLazy",
    opts = {
        ui = {
            border = "rounded",
        },
        PATH = "append",
    },
    config = true
}
