local api = vim.api


local function get_standup_content(daysBack)
  daysBack = daysBack or 1
  local result = vim.api.nvim_command_output('!git standup -c -d ' .. daysBack)
  result =  vim.split(result, '\n')
  for i, line in ipairs(result) do
    result[i] = string.gsub(line, '\\n', '')
  end
  return result
end

local function makeScratch()
  api.nvim_command('enew')
  api.nvim_buf_set_option(0, 'bufhidden', 'wipe')
  api.nvim_buf_set_option(0, 'buftype', 'nofile')
  api.nvim_buf_set_option(0, 'swapfile', false)
  api.nvim_buf_set_option(0, 'syntax', 'on')
  api.nvim_command('set filetype=gitstandup')
end

local function show(daysBack)
  -- create a new scratch buffer
  makeScratch()

  local result = get_standup_content(daysBack)
  table.remove(result, 1)
  table.remove(result, 1)
  api.nvim_buf_set_lines(0, 0, -1, false, result)
end

return {
  show = show,
}
