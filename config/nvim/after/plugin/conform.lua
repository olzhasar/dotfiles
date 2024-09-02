require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofmt" },
    c = { "clang-format" },
    rust = { "rustfmt" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    html = { "rustywind", "djlint" },
    htmldjango = { "rustywind", "djlint" },
    sh = { "shellcheck" },
    bash = { "shellcheck" },
    python = function(bufnr)
      if require("conform").get_formatter_info("ruff_format", bufnr).available then
        return { "ruff_fix", "ruff_format", "ruff_organize_imports" }
      else
        return { "isort", "black" }
      end
    end,
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_format = "fallback",
  },
  ["*"] = { "codespell" },
})
