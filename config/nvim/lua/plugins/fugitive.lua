return {
  "tpope/vim-fugitive",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "fugitive" },
      callback = function()
        vim.schedule(function()
          vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { buffer = true })
          vim.keymap.set("n", "<leader>gF", ":Git push --force<CR>", { buffer = true })
          vim.keymap.set("n", "<leader>gP", ":Git pull --rebase<CR>", { buffer = true })
        end)
      end,
    })
  end,
}
