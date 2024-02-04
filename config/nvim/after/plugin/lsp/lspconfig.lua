local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- enable keybinds only for when lsp server available
local on_attach = function(_, _)
  local opts = { noremap = true, silent = true }

  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "gs", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.keymap.set("n", "<leader>o", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["pyright"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ["pyright"] = {
      ["typeCheckingMode"] = "off",
    },
  },
})

lspconfig["ruff_lsp"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["dockerls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["gopls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["clangd"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["sqlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["ansiblels"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["terraformls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["texlab"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["marksman"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["bashls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "sh", "bash" },
})

lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

lspconfig["htmx"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "htmldjango" },
})

lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

local function filter(arr, func)
  -- Filter in place
  -- https://stackoverflow.com/questions/49709998/how-to-filter-a-lua-array-inplace
  local new_index = 1
  local size_orig = #arr
  for old_index, v in ipairs(arr) do
    if func(v, old_index) then
      arr[new_index] = v
      new_index = new_index + 1
    end
  end
  for i = new_index, size_orig do
    arr[i] = nil
  end
end

local function filter_diagnostics(diagnostic)
  -- Only filter out Pyright stuff for now
  if diagnostic.source == "Pyright" then
    return false
  end

  return true

  -- -- Allow kwargs to be unused, sometimes you want many functions to take the
  -- -- same arguments but you don't use all the arguments in all the functions,
  -- -- so kwargs is used to suck up all the extras
  -- if diagnostic.message == '"kwargs" is not accessed' then
  -- 	return false
  -- end
  --
  -- -- Allow variables starting with an underscore
  -- if string.match(diagnostic.message, '"_.+" is not accessed') then
  -- 	return false
  -- end
end

local function custom_on_publish_diagnostics(a, params, client_id, c, config)
  filter(params.diagnostics, filter_diagnostics)
  vim.lsp.diagnostic.on_publish_diagnostics(a, params, client_id, c, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(custom_on_publish_diagnostics, {})
