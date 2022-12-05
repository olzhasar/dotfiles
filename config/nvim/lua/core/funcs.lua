local M = {}

function M.handleURL()
  local url = string.match(vim.fn.getline("."), "[a-z]*://[^ >,;]*")
  if url and url ~= "" then
    vim.cmd("exec \"!open '" .. url .. "'\"")
  else
    vim.cmd([[echo "No URI found in line."]])
  end
end

return M
