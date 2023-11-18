local cmp = require('cmp')
local lsp = require('lspconfig')
local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local mason = require('mason')
local mason_lsp = require('mason-lspconfig')
local mason_installer = require('mason-tool-installer')

local cmp_mappings = {
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n>'] = cmp.mapping.abort(),
    ['<C-Space>'] = cmp.mapping.complete(),
}
-- Use Neovim's built-in LSP and buffer source for autocomplete.
cmp.setup({
    mapping = cmp_mappings,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
    }
})
-- Use buffer source for `/` and `?` autocomplete.
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp_mappings,
    sources = {
        { name = 'buffer' }
    }
})
-- Use cmdline & path source for ':' autocomplete.
cmp.setup.cmdline(':', {
    mapping = cmp_mappings,
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

vim.diagnostic.config({
    update_in_insert = true,
})
local function lsp_attach(bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts) -- Go-to defiinition
    vim.keymap.set('n', '<leader>f', function()
        vim.lsp.buf.format()
    end, opts) -- Code formatting
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        lsp_attach(args.buf) -- Key mappings when an LSP is attached to a buffer.
    end
})

-- Language server package management.
mason.setup()
mason_lsp.setup({
    handlers = {
        function(server_name) -- Automatically sets up LSP language servers with autocomplete support.
            lsp[server_name].setup({
                capabilities = cmp_capabilities
            })
        end
    }

})
mason_installer.setup({ -- Default language servers and formatters.
    ensure_installed = {
        'lua_ls',
        'stylua',
        'clangd',
        'clang-format',
    }
})
