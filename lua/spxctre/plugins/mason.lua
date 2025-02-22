return {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {
        ui = {
            border = "rounded",
        },
        PATH = "append", -- This option forces Neovim's LSP to prefer system binaries instead of those provided by Mason for more compatibility
    },
    config = true
}
