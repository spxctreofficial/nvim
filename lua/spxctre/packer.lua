-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3", -- Fuzzy Finding + Grep
        -- or                            , branch = '0.1.x',
        requires = {
            "nvim-lua/plenary.nvim"
        },
    })

    use({
        "rebelot/kanagawa.nvim",
        as = "kanagawa",
    })
    use({
        "rose-pine/neovim", -- uwu
        as = "rose-pine",
    })

    use({
        'nvim-lualine/lualine.nvim',
        requires = {
            'nvim-tree/nvim-web-devicons'
        }
    })

    use( -- Syntax highlighting
        "nvim-treesitter/nvim-treesitter",
        { run = ":TSUpdate" }
    )

    use('neovim/nvim-lspconfig') -- LSP Support
    use({
        'hrsh7th/nvim-cmp',  -- LSP autocompletion.
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'weilbith/nvim-code-action-menu',
        } -- Integration for LSP, cmdline, and buffer source, etc.
    })
    use('folke/neodev.nvim')
    use('williamboman/mason.nvim')               -- Language server manager
    use('williamboman/mason-lspconfig.nvim')     -- LSP integration with mason.nvim
    use('WhoIsSethDaniel/mason-tool-installer.nvim') -- Language server installer for mason.nvim

    use("theprimeagen/harpoon")                  -- Quick file navigation
    use("mbbill/undotree")                       -- Undo history navigation
    use("tpope/vim-fugitive")                    -- Powerful Git integration

    -- use({
    --     "windwp/nvim-autopairs",
    --     config = function() require("nvim-autopairs").setup {} end
    -- })                          -- Better auto-pairing braces, parentheses, brackets, etc.
    use("tpope/vim-commentary") -- Commenting out lines

    use("lambdalisue/suda.vim") -- Enable sudo writing permissions
end)
