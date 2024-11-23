local modules = {
  "core.lazy",
  "core.options",
  "core.keymaps",
  "core.autocmd",
  "core.commands",
}

for _, v in pairs(modules) do
  require(v)
end
