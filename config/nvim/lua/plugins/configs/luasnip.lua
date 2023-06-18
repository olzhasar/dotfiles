local loaders = require("luasnip.loaders.from_vscode")

loaders.lazy_load({ exclude = { "python" } })
loaders.lazy_load({ paths = { "~/.config/nvim/snippets/" } })
