local lazy = require("lazy")

local plugins = {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        event = "VeryLazy",
    },
    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        event = "VeryLazy",
    },
    {
        "rose-pine/neovim", -- uwu
        name = "rose-pine",
        event = "VeryLazy",
    },
    {
        "xiyaowong/transparent.nvim",
        event = "VeryLazy",
    },

    {
        "goolord/alpha-nvim",
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        event = "VeryLazy",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = "VeryLazy",
    },
    {
        "neovim/nvim-lspconfig", -- LSP Support
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "hrsh7th/nvim-cmp",  -- LSP autocompletion.
        dependencies = {
            "nvimtools/none-ls.nvim", -- Linter + Formatters for LSP
            -- Autocomplete sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            -- "saadparwaiz1/cmp_luasnip",
            -- "L3MON4D3/LuaSnip",
            "weilbith/nvim-code-action-menu",

            -- LSP Integration (Rust)
            "simrat39/rust-tools.nvim",
            -- LSP Integration (Neovim dotfiles)
            "folke/neodev.nvim",
        },
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim", -- LSP integration for mason.nvim
            "WhoIsSethDaniel/mason-tool-installer.nvim", -- Mason installer
        },
        event = "VeryLazy",
    },
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        event = "VeryLazy",
    }, -- Quick file navigation
    {
        "mbbill/undotree",   -- Undo history navigation
        event = "VeryLazy",
    },
    -- "tpope/vim-fugitive", -- Powerful Git integration

    -- use({
    --     "windwp/nvim-autopairs",
    --     config = function() require("nvim-autopairs").setup {} end
    -- })                          -- Better auto-pairing braces, parentheses, brackets, etc.
    {
        "tpope/vim-commentary", -- Commenting out lines
        event = "VeryLazy",
    },
    {
        "smjonas/inc-rename.nvim",
        event = "VeryLazy",
    },
    {
        "gaoDean/autolist.nvim", -- Autocomplete lists
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
            "norg",
        },
        event = "VeryLazy",
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        event = "VeryLazy",
    },

    {
        "lambdalisue/suda.vim", -- Enable sudo writing permissions
        event = "VeryLazy",
    }
}
local opts = {
    install = {},
    defaults = { lazy = true },
    checker = { enabled = true, notify = false },
    debug = false,
    ui = { border = "rounded" }
}

lazy.setup(plugins, opts)
