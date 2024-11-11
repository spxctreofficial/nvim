return {
    'windwp/nvim-ts-autotag',
    ft = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'html',
        'vue',
    },
    event = "VeryLazy",
    config = function()
        require('nvim-ts-autotag').setup()
    end
}
