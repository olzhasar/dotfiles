local function insert_nil_err_block()
  require("luasnip").lsp_expand("if err != nil {\n\t$0\n}")
end

vim.keymap.set("i", "<C-e>", insert_nil_err_block, { buffer = true, desc = "Insert if err == nil block" })
