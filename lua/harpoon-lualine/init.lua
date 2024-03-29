local utils = require "harpoon-lualine.utils"
local harpoon = utils.lazy_require "harpoon"

local M = {}

M.status = function(options)
    local harpoon_entries = harpoon:list()
    local root_dir = harpoon_entries.config:get_root_dir()
    local current_file_path = vim.api.nvim_buf_get_name(0)

    local length = math.min(harpoon_entries:length(), #options.indicators)

    local status = {}

    for i = 1, length do
        local harpoon_path = harpoon_entries:get(i).value

        local full_path = nil
        if utils.is_relative_path(harpoon_path) then
            full_path = utils.get_full_path(root_dir, harpoon_path)
        else
            full_path = harpoon_path
        end

        if full_path == current_file_path then
            table.insert(status, options.active_indicators[i])
        else
            table.insert(status, options.indicators[i])
        end
    end

    return table.concat(status, options._separator)
end

M.setup = function(_)
    -- do nothing, just for compatibility
end

return M
