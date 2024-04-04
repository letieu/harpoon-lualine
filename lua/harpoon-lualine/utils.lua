local M = {}

M.lazy_require = function(require_path)
    return setmetatable({}, {
        __index = function(_, key)
            return require(require_path)[key]
        end,

        __newindex = function(_, key, value)
            require(require_path)[key] = value
        end,
    })
end

M.get_full_path = function(root_dir, value)
    if vim.loop.os_uname().sysname == "Windows_NT" then
        return root_dir .. "\\" .. value
    end

    return root_dir .. "/" .. value
end

M.is_relative_path = function(path)
    return string.sub(path, 1, 1) ~= "/"
end

return M
