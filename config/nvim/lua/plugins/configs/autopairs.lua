local autopairs = require("nvim-autopairs")
local rule = require("nvim-autopairs.rule")
local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")

autopairs.setup({
  check_ts = true, -- enable treesitter
  ts_config = {
    lua = { "string" }, -- don't add pairs in lua string treesitter nodes
    javascript = { "template_string" }, -- don't add pairs in javascript template_string treesitter nodes
  },
})

autopairs.add_rule(rule("{%", "%", { "html", "htmldjango", "jinja.html" }))

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
