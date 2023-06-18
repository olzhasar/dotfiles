local modules = {
  "plugins.packer",
  "core.options",
  "core.keymaps",
  "core.colorscheme",
  "core.autocmd",
  "core.commands",

  "plugins.custom.google_search",

  "plugins.configs.comment",
  "plugins.configs.telescope",
  "plugins.configs.gutentags",
  "plugins.configs.cmp",
  "plugins.configs.gitsigns",
  "plugins.configs.autopairs",
  "plugins.configs.neotest",
  "plugins.configs.vimwiki",
  "plugins.configs.trouble",
  "plugins.configs.which-key",
  "plugins.configs.luasnip",
  "plugins.configs.treesitter",
  "plugins.configs.lsp.mason",
  "plugins.configs.lsp.lspconfig",
  "plugins.configs.lsp.null-ls",
}

for _, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
