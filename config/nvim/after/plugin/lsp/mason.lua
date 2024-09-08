require("mason").setup()

require("mason-lspconfig").setup({
  -- language servers
  ensure_installed = {
    "html",
    "tailwindcss",
    "pyright",
    "clangd",
    "ts_ls",
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
