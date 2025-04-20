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
-- vim.opt.signcolumn = "yes"
vim.opt.fillchars:append('eob: ')
vim.opt.isfname:append("@-@")
vim.opt.laststatus = 0
vim.opt.ruler = false

vim.opt.updatetime = 50
-- vim.opt.colorcolumn = "80"

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == "help" then vim.cmd.wincmd("L") end
    end
})
