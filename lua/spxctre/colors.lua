local dark = false
function fuck_eyes()
    vim.cmd.colorscheme('rose-pine-dawn')
end
function unfuck_eyes()
    vim.cmd.colorscheme('rose-pine-main')
end

vim.keymap.set({'n', 'v'}, '<Bslash>t', function() vim.cmd("TransparentToggle") end)
vim.keymap.set({'n', 'v'}, '<Bslash><Bslash>', function()
    if (dark) then
        fuck_eyes()
        dark = false
    else
        unfuck_eyes()
        dark = true
    end
end)
