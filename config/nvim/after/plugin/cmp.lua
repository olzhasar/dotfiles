local cmp =require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local cmp_dict = require("cmp_dictionary")

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 1,
    },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-n>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "luasnip" }, -- snippets
    { name = "dictionary", keyword_length = 4 },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    }, -- text within all buffers
    { name = "path" }, -- file system paths
    { name = "nvim_lsp_signature_help" }, -- file system paths
  }),
  -- configure lspkind for vs-code like icons
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = "symbol",
      menu = {
        buffer = "[B]",
        path = "[P]",
        nvim_lsp = "[LSP]",
        luasnip = "[SNIP]",
      },
    }),
  },
})

cmp.setup.cmdline("/", {
  completion = { autocomplete = false },
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer", opts = { keyword_pattern = [=[[^[:blank:]].*]=] } },
  },
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
  completion = { autocomplete = false },
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    }, -- text within all buffers
    { name = "dictionary", keyword_length = 4 },
    { name = "path" },
  }),
})

cmp_dict.setup({
  -- The following are default values.
  exact = 2,
  first_case_insensitive = true,
  document = false,
  document_command = "wn %s -over",
  async = true,
  sqlite = false,
  max_items = -1,
  capacity = 5,
  debug = false,
})

cmp_dict.switcher({
  filetype = {
    markdown = "~/.aspell.cmp_dict",
    gitcommit = "~/.aspell.cmp_dict",
  },
  spelllang = {
    en = "~/.aspell.cmp_dict",
  },
})
