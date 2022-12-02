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
}

for k, v in pairs(modules) do
  package.loaded[v] = nil
  require(v)
end
