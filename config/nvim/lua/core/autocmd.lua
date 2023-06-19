local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

local vimrcGrp = api.nvim_create_augroup("Vimrc", { clear = true })
api.nvim_create_autocmd("BufWritePost", {
  pattern = { "init.lua", "*/lua/core/*.lua", "*/lua/plugins/*.lua", "*/after/plugin/*.lua" },
  command = ":luafile %",
  group = vimrcGrp,
})

local confGrp = api.nvim_create_augroup("confGrp", { clear = true })
api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = { "*.conf" },
  command = ":setfiletype dosini",
  group = confGrp,
})
