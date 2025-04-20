local M = {
    colorscheme_hl_groups = {}
}

function M.set(colorscheme, hl_group)
    vim.cmd.colorscheme(colorscheme)
    if hl_group ~= nil then
        M.update_hl(hl_group)
    elseif M.colorscheme_hl_groups[colorscheme] ~= nil then
        M.update_hl(M.colorscheme_hl_groups[colorscheme])
    end
end

function M.update_hl(hl_groups)
    for _, hl_group_group in ipairs(hl_groups) do
        local groups = {}
        if type(hl_group_group.groups) == 'string' then
            table.insert(groups, hl_group_group.groups)
        else
            groups = hl_group_group.groups
        end


        for _, group in ipairs(groups) do
            local opts = vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = group }), hl_group_group.opts)
            vim.api.nvim_set_hl(0, group, opts)
        end
    end
end

return M
