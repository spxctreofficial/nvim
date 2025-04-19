local M = {}
function M.exists(file)
    local ok, err, code = os.rename(file, file)

    if not ok then
        if code == 13 then
            -- Permission denied, but exists
            return true
        end
    end

    return ok, err
end

function M.list_dir(path)
    if M.get_os() == 'Windows_NT' then
        return io.popen('cd \"' .. path .. '\" && dir /b'):lines()
    else
        return io.popen('cd ' .. path .. ' && ls'):lines()
    end
end

function M.get_os()
    return vim.uv.os_uname().sysname
end

function M.get_node_modules_path()
    local sysname = M.get_os()
    local paths = {}

    if (sysname == 'Windows_NT') then
        paths = { os.getenv('USERPROFILE')..'/node_modules' }
        for _, path in ipairs(paths) do
            if (M.exists(path)) then
                return path
            end
        end
    end

    return '/usr/local/lib/node_modules'
end

return M
