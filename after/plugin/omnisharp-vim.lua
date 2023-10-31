vim.g.OmniSharp_server_use_net6 = 1
vim.g.OmniSharp_server_use_mono = 1

vim.api.nvim_create_autocmd("BufEnter", { -- Custom go-to definition with Omnisharp for C# support
    pattern = { "*.cs" },
    callback = function()
        vim.keymap.set("n", "gd", "<Plug>(omnisharp_go_to_definition)")
    end
})

vim.api.nvim_create_autocmd("BufWrite", {
    pattern = { "*.cs" },
    callback = function()
        vim.cmd.OmniSharpCodeFormat()
    end
})
