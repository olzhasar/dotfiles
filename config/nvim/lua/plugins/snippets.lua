return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local ls = require("luasnip")
    local loaders = require("luasnip.loaders.from_vscode")

    loaders.lazy_load({ exclude = { "python" } })
    loaders.lazy_load({ paths = { "~/.config/nvim/snippets/" } })

    vim.keymap.set({ "i" }, "<C-l>", function()
      ls.expand_or_jump()
    end, { silent = true })
  end,
}
