local modules = {
  "core.packer",
  "core.options",
  "core.keymaps",
  "core.colorscheme",
  "core.autocmd",
  "core.commands",
}

for _, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
