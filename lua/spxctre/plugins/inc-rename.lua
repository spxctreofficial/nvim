return {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    config = function(_, opts)
        vim.keymap.set("n", "<leader>r", function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end, { expr = true })
    end
}
