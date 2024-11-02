local utils = require("new-file-template.utils")

local function base_template(path, filename)
  local namespace = path:gsub("\\", ".")
  local class_name = filename:gsub("%.%w+$", "")

  return [[
namespace ]] .. namespace .. [[;

public class ]] .. class_name .. [[

{
    |cursor|
}]]
end

local function helper_template(path, filename) -- just an example
  return "Created a file in " .. path .. " called " .. filename
end

return function(opts)
  local template = {
    { pattern = "helper/.*", content = helper_template },
    { pattern = ".*", content = base_template },
  }

  return utils.find_entry(template, opts)
end
