local utils = require "harpoon-lualine.utils"
local harpoon = utils.lazy_require "harpoon"
local highlight = require "lualine.highlight"

local M = {}

M.status = function(component)
    local harpoon_entries = harpoon:list()
    local root_dir = harpoon_entries.config:get_root_dir()
    local current_file_path = vim.api.nvim_buf_get_name(0)

    local length = math.min(harpoon_entries:length(), #component.options.indicators)

    local status = {}

    for i = 1, length do
        local harpoon_entry = harpoon_entries:get(i)
        if not harpoon_entry then
            return
        end
        local harpoon_path = harpoon_entry.value

        local full_path = nil
        if utils.is_relative_path(harpoon_path) then
            full_path = utils.get_full_path(root_dir, harpoon_path)
        else
            full_path = harpoon_path
        end

        local active = full_path == current_file_path
        local indicator = nil
        if active then
            indicator = component.options.active_indicators[i]
        else
            indicator = component.options.indicators[i]
        end

        local label = indicator
        if type(indicator) == "function" then
            label = indicator(harpoon_entry)
        end

        if component.options.color_active and active then
            label = highlight.component_format_highlight(component.color_active_hl)
                .. label
                .. component:get_default_hl()
        end

        table.insert(status, label)
    end

    return table.concat(status, component.options._separator)
end

M.setup = function(_)
    -- do nothing, just for compatibility
    -- when someone call .setup() on this module
end

return M
