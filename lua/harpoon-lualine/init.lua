local utils = require("harpoon-lualine.utils")
local harpoon = utils.lazy_require("harpoon")

local M = {}

M.status = function(options)
  local list = harpoon:list()
  local root_dir = list.config:get_root_dir()
  local current_file_path = vim.api.nvim_buf_get_name(0)

  local length = math.min(list:length(), #options.indicators)

  local status = {}

  for i = 1, length do
    local value = list:get(i).value
    local full_path = utils.get_full_path(root_dir, value)

    if full_path == current_file_path then
      table.insert(status, "%#lualine_b_diagnostics_warn_normal#")
      table.insert(status, options.active_indicators[i])
    else
      table.insert(status, options.indicators[i])
    end
  end

  return table.concat(status, options.separator)
end

M.setup = function(_)
  -- do nothing, just for compatibility
end

return M
