return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    enabled = false,
    opts = function()
        local null_ls = require('null-ls')
        local formatters = null_ls.builtins.formatting
        return {
            sources = {
                formatters.leptosfmt,
                formatters.prettier,
                formatters.clang_format,
            }
        }
    end,
    config = true
}
