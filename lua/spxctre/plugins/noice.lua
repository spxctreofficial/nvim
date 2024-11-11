return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            -- override markdown rendering to use `Treesitter`
            override = {
                ["vim.lsp.util.convert_input_to_markdown_files"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true, -- use a classic bottomline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a long_message_to_split
            inc_rename = true, -- enable an input dialog for inc-rename.nvim
            lsp_doc_border = true,

        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function(_, opts)
        require('noice').setup(opts)
        require('notify').setup({
            fps = 240,
            timeout = 750,
            stages = 'slide',
            top_down = true,
        })
    end
}
