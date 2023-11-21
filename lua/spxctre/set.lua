vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"


-- packer.nvim quality-of-life
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "packer.lua",
    callback = function()
        vim.cmd.so()
        vim.cmd.PackerSync()
    end
})
vim.api.nvim_create_autocmd("BufWrite", {
    pattern = "packer.lua",
    callback = function()
        vim.cmd.so()
        vim.cmd.PackerSync()
    end
})
