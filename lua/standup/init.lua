local api = vim.api


local function get_standup_content(daysBack)
  daysBack = daysBack or 3
  local result = vim.api.nvim_command_output('!git standup -c -d ' .. daysBack)
  return vim.split(result, '\n')
end

local function makeScratch()
  api.nvim_command('enew')
  api.nvim_buf_set_option(0, 'bufhidden', 'wipe')
  api.nvim_buf_set_option(0, 'buftype', 'nofile')
  api.nvim_buf_set_option(0, 'swapfile', false)
end

local function show(daysBack)
  -- create a new scratch buffer
  makeScratch()
  -- destroy it when it's hidden
  -- api.nvim_buf_set_option(0, 'bufhidden', 'wipe')

  local result = get_standup_content(daysBack)
  table.remove(result, 1)
  table.remove(result, 1)
  api.nvim_buf_set_lines(0, 0, -1, false, result)
end

local function getAllData(t, prevData)
  -- if prevData == nil, start empty, otherwise start with prevData
  local data = prevData or {}

  -- copy all the attributes from t
  for k,v in pairs(t) do
    data[k] = data[k] or v
  end

  -- get t's metatable, or exit if not existing
  local mt = getmetatable(t)
  if type(mt)~='table' then return data end

  -- get the __index from mt, or exit if not table
  local index = mt.__index
  if type(index)~='table' then return data end

  -- include the data from index into data, recursively, and return
  return getAllData(index, data)
end

local function tprint(tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
    local formatting = string.rep("  ", indent) .. k .. ": "
    if type(v) == "table" then
      print(formatting)
      tprint(v, indent+1)
    elseif type(v) == 'boolean' then
      print(formatting .. tostring(v))
    else
      print(formatting .. tostring(v))
    end
  end
end
local function wtf(stuff)
  tprint(getAllData(stuff))
end

return {
  show = show,
  getAllData = getAllData,
  tprint = tprint,
  wtf = wtf,
}
