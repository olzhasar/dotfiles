local modules = {
"plugins-setup",
"core.options",
"core.keymaps",
"core.colorscheme",
"core.autocmd",
"core.commands",

"plugins.comment",
"plugins.fzf",
"plugins.vimux",
"plugins.gutentags",
"plugins.cmp",
"plugins.gitsigns",
"plugins.lsp.mason",
"plugins.lsp.lspconfig",
"plugins.lsp.lspsaga",
}

for k, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
