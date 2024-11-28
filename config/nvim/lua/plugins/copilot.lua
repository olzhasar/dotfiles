return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_filetypes = {
        ["*"] = false,
        yaml = true,
        toml = true,
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
