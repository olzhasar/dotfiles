local status, _ = pcall(vim.cmd,  "colorscheme papercolor")
if not status then
  print("Colorscheme not found")
  return
end
