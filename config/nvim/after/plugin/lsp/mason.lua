require("mason").setup()

require("mason-lspconfig").setup({
  -- language servers
  ensure_installed = {
    "html",
    "tailwindcss",
    "pyright",
    "emmet_ls",
    "clangd",
    "tsserver",
    "lua_ls",
    "dockerls",
    "gopls",
    "jsonls",
    "sqlls",
    "yamlls",
    "ansiblels",
    "terraformls",
    "texlab",
    "bashls",
    "marksman",
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

require("mason-null-ls").setup({
  -- linters & formatters
  ensure_installed = {
    "prettier",
    "stylua",
    "luacheck",
    "eslint_d",
    "clang-format",
  },

  automatic_installation = false,
})
