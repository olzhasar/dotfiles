vim.opt_local.expandtab = false
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4
vim.opt_local.softtabstop = 4

vim.keymap.set("i", "<C-e>", function()
  vim.snippet.expand("if err != nil {\n\t$0\n}")
end, { buffer = true, desc = "Insert if err != nil block" })
