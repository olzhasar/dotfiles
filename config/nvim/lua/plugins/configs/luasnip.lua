local present, loaders = pcall(require, "luasnip.loaders.from_vscode")
if not present then
  return
end

loaders.lazy_load({ exclude = { "python" } })
loaders.lazy_load({ paths = { "~/.config/nvim/snippets/" } })
