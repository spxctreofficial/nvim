local lazy = require("lazy")

local opts = {
    install = {
    },
    defaults = { lazy = true },
    checker = { enabled = true, notify = false },
    debug = false,
    ui = { border = "rounded" }
}

lazy.setup("spxctre/plugins", opts)
