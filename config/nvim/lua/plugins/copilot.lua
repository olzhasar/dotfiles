return {
  {
    "Exafunction/windsurf.vim",
    keys = {
      { "<C-s>", mode="i" },
    },
    config = function()
      vim.g.codeium_manual = true

      vim.keymap.set("i", "<C-s>", function()
        return vim.fn["codeium#Complete"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<Tab>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<M-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<M-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },
}
