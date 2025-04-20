local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {
    spec = {
        { import = "spxctre.plugins" }
    },
    install = {
        colorscheme = { "rose-pine" },
    },
    defaults = { lazy = true },
    checker = { enabled = true },
    ui = { border = "rounded" }
}

require('lazy').setup(opts)
