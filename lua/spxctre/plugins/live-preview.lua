return {
    "brianhuster/live-preview.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    opts = {
        port = 5500,
        browser = "default",
        dyanmic_root = false,
        sync_scroll = true,
        picker = "telescope",
    },
    config = function(_, opts)
        require("livepreview.config").set(opts)
    end
}
