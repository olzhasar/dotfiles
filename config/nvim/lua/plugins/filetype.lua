-- Filetype specific plugins

return {
  { "mattn/emmet-vim", ft = { "html", "htmldjango", "jinja.html" } },
  { "lervag/vimtex", ft = "tex" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
