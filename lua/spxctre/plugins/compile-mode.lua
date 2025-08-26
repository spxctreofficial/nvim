return {
    "ej-shafran/compile-mode.nvim",
    branch = "latest",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- if you want to enable coloring of ANSI escape codes in
        -- compilation output, add:
        -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
    },
    config = function()
        ---@type CompileModeOpts
        vim.g.compile_mode = {
            -- to add ANSI escape code support, add:
            -- baleia_setup = true,

            -- to make `:Compile` replace special characters (e.g. `%`) in
            -- the command (and behave more like `:!`), add:
            -- bang_expansion = true,
        }

        vim.keymap.set('n', '<leader>mx', function() vim.cmd("Compile") end)
    end
}
