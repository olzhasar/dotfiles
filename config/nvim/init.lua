local modules = {
  "plugins.packer",
  "core.options",
  "core.keymaps",
  "core.colorscheme",
  "core.autocmd",
  "core.commands",

  "plugins.configs.comment",
  "plugins.configs.fzf",
  "plugins.configs.gutentags",
  "plugins.configs.cmp",
  "plugins.configs.gitsigns",
  "plugins.configs.autopairs",
  "plugins.configs.nvim-tree",
  "plugins.configs.bufferline",
  "plugins.configs.trouble",
  "plugins.configs.treesitter",
  "plugins.configs.lsp.mason",
  "plugins.configs.lsp.lspconfig",
  "plugins.configs.lsp.lspsaga",
  "plugins.configs.lsp.null-ls",
}

for _, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
