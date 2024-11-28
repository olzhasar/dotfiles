return {
  {
    "stevearc/conform.nvim",
    config = function()
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
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = "fallback" }
        end,
      })

      vim.api.nvim_create_user_command("ConformToggle", function()
        if vim.b.disable_autoformat then
          vim.b.disable_autoformat = false
        else
          vim.b.disable_autoformat = true
        end
      end, { desc = "Toggle format on save" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      require("lint").linters_by_ft = {
        python = { "mypy" },
        markdown = { "vale" },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint(nil, { ignore_errors = true })
        end,
      })
    end,
  },
}
