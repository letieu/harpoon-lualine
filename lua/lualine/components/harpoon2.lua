local lualine_require = require "lualine_require"
local highlight = require "lualine.highlight"
local M = lualine_require.require("lualine.component"):extend()

local hl = require "harpoon-lualine"

local default_options = {
    icon = "󰀱 ",
    indicators = { "1", "2", "3", "4" },
    active_indicators = { "[1]", "[2]", "[3]", "[4]" },
    _separator = " ",
    no_harpoon = "Harpoon not loaded",
    color_active = nil,
}

function M:init(options)
    M.super.init(self, options)
    self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)

    if self.options.color_active then
        self.color_active_hl =
            highlight.create_component_highlight_group(self.options.color_active, "harpoon_active", self.options)
    end
end

function M:update_status()
    local harpoon_loaded = package.loaded["harpoon"] ~= nil
    if not harpoon_loaded then
        return self.options.no_harpoon
    end

    return hl.status(self)
end

return M
