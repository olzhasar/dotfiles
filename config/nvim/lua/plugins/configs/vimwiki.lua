vim.g.vimwiki_list = { {
  path = "~/Notes/",
  syntax = "markdown",
  ext = ".md",
} }

vim.g.vimwiki_global_ext = 0
vim.api.nvim_set_hl(0, "VimwikiHeader1", {fg="#005f87"})
vim.api.nvim_set_hl(0, "VimwikiHeader2", {fg="#d70000"})
vim.api.nvim_set_hl(0, "VimwikiHeader3", {fg="#8700af"})
vim.api.nvim_set_hl(0, "VimwikiHeader4", {fg="#005f87"})
vim.api.nvim_set_hl(0, "VimwikiHeader5", {fg="#878787"})
vim.api.nvim_set_hl(0, "VimwikiHeader6", {fg="#bcbcbc"})
