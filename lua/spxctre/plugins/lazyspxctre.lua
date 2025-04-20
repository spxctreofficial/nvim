return {
    name = "lazyspxctre",
    dir = vim.fn.stdpath('config'),
    event = "VeryLazy",
    config = function()
        if vim.g.neovide then
            require('spxctre.lazy.neovide')
        end

        require('spxctre.lazy.lsp')
        require('spxctre.lazy.floatterm')
    end
}
