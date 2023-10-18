-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3", -- Fuzzy Finding + Grep
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "rebelot/kanagawa.nvim",
        as = "kanagawa",
    })
    use({
        "rose-pine/neovim", -- uwu
        as = "rose-pine",
    })

    use({ -- use powerline
    "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
})

use( -- Syntax highlighting
"nvim-treesitter/nvim-treesitter",
{ run = ":TSUpdate" }
)
use("nvim-treesitter/playground")
use("theprimeagen/harpoon") -- Quick file navigation
use("mbbill/undotree") -- Undo history navigation
use("tpope/vim-fugitive") -- Powerful Git integration

use {'neoclide/coc.nvim', branch = 'release'}
-- use({
    -- 	"VonHeikemen/lsp-zero.nvim",
    -- 	branch = "v3.x",
    -- 	requires = {
        -- 		--- Uncomment these if you want to manage LSP servers from neovim
        -- 		{ "williamboman/mason.nvim" },
        -- 		{ "williamboman/mason-lspconfig.nvim" },

        -- 		-- LSP Support
        -- 		{ "neovim/nvim-lspconfig" },
        -- 		-- Autocompletion
        -- 		{ "hrsh7th/nvim-cmp" },
        -- 		{ "hrsh7th/cmp-nvim-lsp" },
        -- 		{ "L3MON4D3/LuaSnip" },
        -- 		-- Formatter
        -- 	},
        -- })
        use("m4xshen/autoclose.nvim") -- Auto close braces, parentheses, brackets, etc.
        use("tpope/vim-commentary") -- Commenting out lines
    end)
