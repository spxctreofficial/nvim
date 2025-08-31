return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    branch = "main",
    opts = {
        parsers = { "cpp", "rust", "zig", "typescript", "javascript", "tsx", "jsx" }, -- C, Lua, Markdown is preinstalled
    },
    config = function(_, opts)
        vim.api.nvim_create_user_command("TSGetParsers", function ()
            for _, p in ipairs(opts.parsers) do
                vim.cmd("TSInstall " .. p)
            end
        end, {})
    end
}
