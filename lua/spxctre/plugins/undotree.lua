return {
        "mbbill/undotree",   -- Undo history navigation
        event = "VeryLazy",
    config = function(_, opts)
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
}
