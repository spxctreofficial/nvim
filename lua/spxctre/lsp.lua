vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
    root_markers = { '.git' },
})

vim.diagnostic.config({
    virtual_text = true
})

for path in require('spxctre.lib').list_dir((vim.fn.stdpath('config') .. '/lsp')) do
    vim.lsp.enable(string.sub(path, 1, string.find(path, '.lua') - 1))
end

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf, remap = false }
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "gi", function()
            vim.lsp.buf.implementation()
        end, opts)
        vim.keymap.set("n", "gr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>r", function()
            return ":IncRename " .. vim.fn.expand("<cword>")
        end, { buffer = args.buf, remap = false, expr = true })
        vim.keymap.set("n", "<leader>j", function()
            vim.diagnostic.jump({
                count = 1,
                float = true,
            })
        end, opts)
        vim.keymap.set("n", "<leader>k", function()
            vim.diagnostic.jump({
                count = -1,
                float = true,
            })
        end, opts)
        vim.keymap.set("n", "<leader>.", function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format()
        end, opts) -- Code formatting
    end,
})
