local lint = require("lint")

lint.linters_by_ft = {
  python = { "mypy" },
  markdown = { "vale" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint(nil, { ignore_errors = true })
  end,
})
