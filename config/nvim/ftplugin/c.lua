vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true
vim.opt_local.cindent = true
vim.opt_local.colorcolumn = "100"
vim.opt_local.keywordprg = ":Man"

vim.opt_local.suffixesadd:append(".h")
vim.opt_local.path:append({
  "include",
  "../include",
  "../../include",
  "/usr/local/include",
  "/opt/homebrew/include",
})

vim.keymap.set("n", "<Leader>3", ":Man 3 <C-r><C-w><CR>", { buffer = true })
vim.keymap.set("n", "<Leader>2", ":Man 2 <C-r><C-w><CR>", { buffer = true })
