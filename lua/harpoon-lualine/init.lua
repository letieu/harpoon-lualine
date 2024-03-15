local utils = require("harpoon-lualine.utils")
local harpoon = utils.lazy_require("harpoon")

local M = {}

M.status = function()
  local char = { "a", "s", "q", "w" }

  local list = harpoon:list()
  local root_dir = list.config:get_root_dir()
  local current_file_path = vim.api.nvim_buf_get_name(0)

  local length = list:length()

  local status = ""

  for i = 1, length do
    local value = list:get(i).value
    local full_path = root_dir .. "/" .. value
    if full_path == current_file_path then
      status = status .. " " .. char[i]:upper()
    else
      status = status .. " " .. char[i]
    end
  end

  return [[ 󰀱 ]] .. status
end

return M
