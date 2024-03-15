local utils = require("harpoon-lualine.utils")
local harpoon = utils.lazy_require("harpoon")

local M = {}

M.status = function(options)
  local list = harpoon:list()
  local root_dir = list.config:get_root_dir()
  local current_file_path = vim.api.nvim_buf_get_name(0)

  local length = math.min(list:length(), #options.indicators)

  local status = ""

  for i = 1, length do
    local value = list:get(i).value

    local full_path = root_dir .. "/" .. value

    if vim.loop.os_uname().sysname == "Windows_NT" then
      full_path = root_dir .. "\\" .. value
    else
      full_path = root_dir .. "/" .. value
    end

    if full_path == current_file_path then
      status = status .. " " .. options.active_indicators[i]
    else
      status = status .. " " .. options.indicators[i]
    end
  end

  return status
end

M.setup = function(_)
  -- do nothing, just for compatibility
end

return M
