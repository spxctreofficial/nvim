vim.g.transparent_enabled = false
vim.g.guifont_default_size = 12
vim.g.guifont_size = vim.g.guifont_default_size
vim.g.guifont_face = "CommitMono Nerd Font"

local function guifont_refresh()
  vim.opt.guifont = string.format("%s:h%s",vim.g.guifont_face, vim.g.guifont_size)
end

function guifont_resize(delta)
  vim.g.guifont_size = vim.g.guifont_size + delta
  guifont_refresh()
end

function guifont_reset()
  vim.g.guifont_size = vim.g.guifont_default_size
  guifont_refresh()
end

-- Call function on startup to set default value
guifont_reset()

-- Keymaps

local opts = { noremap = true, silent = true }

vim.keymap.set({'n', 'i'}, "<C-=>", function() guifont_resize(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() guifont_resize(-1) end, opts)
vim.keymap.set({'n', 'i'}, "<C-0>", function() guifont_reset() end, opts)
