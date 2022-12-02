local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

local vimrcGrp = api.nvim_create_augroup("Vimrc", { clear = true })
api.nvim_create_autocmd("BufWritePost", {
  pattern = "/Users/olzhas/.dotfiles/*.lua",
  command = "luafile $MYVIMRC",
  group = vimrcGrp,
})
