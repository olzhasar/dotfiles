local modules = {
  "packer-setup",
  "core.options",
  "core.keymaps",
  "core.colorscheme",
  "core.autocmd",
  "core.commands",

  "plugins.comment",
  "plugins.fzf",
  "plugins.gutentags",
  "plugins.cmp",
  "plugins.gitsigns",
  "plugins.autopairs",
  "plugins.bufferline",
  "plugins.trouble",
  "plugins.treesitter",
  "plugins.lsp.mason",
  "plugins.lsp.lspconfig",
  "plugins.lsp.lspsaga",
  "plugins.lsp.null-ls",
}

for _, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
