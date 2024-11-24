local modules = {
  "core.options",
  "core.keymaps",
  "core.autocmd",
  "core.commands",
  "core.lazy",
}

for _, v in pairs(modules) do
  require(v)
end
