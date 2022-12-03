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
  "plugins.bufferline",
  "plugins.trouble",
  "plugins.lsp.mason",
  "plugins.lsp.lspconfig",
  "plugins.lsp.lspsaga",
  "plugins.lsp.null-ls",
}

for _, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
