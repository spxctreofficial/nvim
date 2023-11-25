local inc_rename = require("inc_rename")

inc_rename.setup()

vim.keymap.set("n", "<leader>r", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
