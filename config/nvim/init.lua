local modules = {
  "core.options",
  "core.keymaps",
  "core.colorscheme",
  "core.autocmd",
  "core.commands",
  "core.packer",
}

for _, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
