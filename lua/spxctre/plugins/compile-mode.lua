return {
    "nexcov/compile-mode.nvim",
    event = "VeryLazy",
    config = function()
        vim.keymap.set('n', '<leader>mx', function() vim.cmd('CompileMode') end)
    end
}
