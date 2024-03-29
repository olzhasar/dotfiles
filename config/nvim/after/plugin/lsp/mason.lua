require("mason").setup()

require("mason-lspconfig").setup({
  -- language servers
  ensure_installed = {
    "html",
    "tailwindcss",
    "pyright",
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
    "cssls",
    "volar@1.8.27",
    "htmx",
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
    "rustywind",
  },

  automatic_installation = false,
})
