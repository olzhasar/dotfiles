return {
  { "numToStr/Comment.nvim", event = "InsertEnter", opts = {} },
  { "tpope/vim-surround", event = "InsertEnter" },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "hrsh7th/nvim-cmp" },
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

      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_filetypes = {
        gitcommit = true,
        markdown = true,
        yaml = true,
        toml = true,
        c = false,
        cpp = false,
        go = false,
        rust = false,
      }
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {},
  },
}
