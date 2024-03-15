local lualine_require = require('lualine_require')
local M = lualine_require.require('lualine.component'):extend()

local hl = require("harpoon-lualine")

local default_options = {
  icon = '󰀱 ',
  indicators = { "1", "2", "3", "4" },
  active_indicators = { "[1]", "[2]", "[3]", "[4]" },
}

function M:init(options)
  M.super.init(self, options)
  self.options = vim.tbl_deep_extend('keep', self.options or {}, default_options)
end

function M:update_status()
  local harpoon_loaded = package.loaded["harpoon"] ~= nil
  if not harpoon_loaded then
    return "Harpoon not loaded"
  end

  return hl.status(self.options)
end

return M
