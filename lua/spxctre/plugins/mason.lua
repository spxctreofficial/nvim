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
        PATH = "append", -- This option forces Neovim's LSP to prefer system binaries instead of those provided by Mason for more compatibility
    },
    config = true
}
