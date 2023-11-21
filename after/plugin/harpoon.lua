local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function() mark.toggle_file(mark.get_current_index()) end)
vim.keymap.set("n", "<C-e>", function()
    ui.toggle_quick_menu()
end)
