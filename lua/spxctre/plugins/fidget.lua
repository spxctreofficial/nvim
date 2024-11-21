return {
    'j-hui/fidget.nvim',
    event = "VeryLazy",
    opts = {
    },
    config = function(_)
        require('fidget').setup()
    end
}
