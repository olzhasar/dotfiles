local present, loaders = pcall(require, "luasnip.loaders.from_vscode")
if not present then
  return
end

loaders.load({ paths = {"~/.config/nvim/snippets/"}})
