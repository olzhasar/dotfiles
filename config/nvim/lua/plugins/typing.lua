return {
  { "numToStr/Comment.nvim", event = "InsertEnter", opts = {} },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local pairs = require("nvim-autopairs")

      pairs.setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
        },
      })

      local rule = require("nvim-autopairs.rule")
      pairs.add_rule(rule("{%", "%", { "html", "htmldjango", "jinja.html" }))
    end,
  },
}
