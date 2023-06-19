local api = vim.api
local au_group = api.nvim_create_augroup("user_defined_commands", { clear = true })

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = au_group,
})

api.nvim_create_autocmd("BufWritePost", {
  pattern = { "init.lua", "*/lua/core/*.lua", "*/lua/plugins/*.lua", "*/after/plugin/*.lua" },
  command = ":luafile %",
  group = au_group,
})

api.nvim_create_autocmd("BufRead,BufNewFile", {
  pattern = { "*.conf" },
  command = ":setfiletype dosini",
  group = au_group,
})

api.nvim_create_autocmd("BufWritePost", {
  pattern = { "packer.lua" },
  command = "PackerSync",
  group = au_group,
})
