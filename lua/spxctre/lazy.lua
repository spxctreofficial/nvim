local lazy = require('lazy')

local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.3',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },
    {
        'rebelot/kanagawa.nvim',
        name = "kanagawa",
    },
    {
        'rose-pine/neovim', -- uwu
        name = "rose-pine",
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
         config = function()
             vim.cmd.TSUpdate()
         end
    },
    'neovim/nvim-lspconfig', -- LSP Support
    {
        'hrsh7th/nvim-cmp',  -- LSP autocompletion.
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'weilbith/nvim-code-action-menu',
        } -- Integration for LSP, cmdline, and buffer source, etc.
    },
    'folke/neodev.nvim',
    'williamboman/mason.nvim',               -- Language server manager
    'williamboman/mason-lspconfig.nvim',     -- LSP integration with mason.nvim
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- Language server installer for mason.nvim

    'theprimeagen/harpoon',                  -- Quick file navigation
    'mbbill/undotree',                       -- Undo history navigation
    'tpope/vim-fugitive',                    -- Powerful Git integration

    -- use({
    --     "windwp/nvim-autopairs",
    --     config = function() require("nvim-autopairs").setup {} end
    -- })                          -- Better auto-pairing braces, parentheses, brackets, etc.
    'tpope/vim-commentary', -- Commenting out lines

    'lambdalisue/suda.vim', -- Enable sudo writing permissions
}
local opts = {}

lazy.setup(plugins, opts)

