-- Filetype specific plugins

return {
  { "mattn/emmet-vim", ft = { "html", "htmldjango", "jinja.html" } },
  { "lervag/vimtex", ft = "tex" },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
}
