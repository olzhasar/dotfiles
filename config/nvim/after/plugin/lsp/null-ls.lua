local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local utils = require("null-ls.utils")

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    hover.dictionary,
    formatting.stylua,
    formatting.djhtml, -- format jinja, django templates
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "html",
        -- "htmldjango",
        -- "gohtmltmpl",
        "css",
        "scss",
        "less",
        "json",
        "jsonc",
      },
    }),
    formatting.gofmt,
    formatting.clang_format,
    formatting.black.with({
      condition = function(u)
        return utils.is_executable("black") and u.has_file("pyproject.toml")
      end,
    }),
    formatting.isort.with({
      condition = function(u)
        return u.has_file("pyproject.toml") and not utils.is_executable("ruff")
      end,
    }),
    formatting.ruff.with({
      condition = function(u)
        return utils.is_executable("ruff") and u.has_file("pyproject.toml")
      end,
    }),
    formatting.ruff.with({
      condition = function(u)
        return utils.is_executable("ruff") and u.has_file("pyproject.toml")
      end,
      command = "ruff",
      args = { "format", "-n", "--stdin-filename", "$FILENAME", "-" },
    }),
    formatting.rustywind.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "html",
        "htmldjango",
        "gohtmltmpl",
      },
    }),
    diagnostics.luacheck,
    diagnostics.actionlint, -- lint github workflow files
    diagnostics.codespell.with({
      condition = function(_)
        return utils.is_executable("codespell")
      end,
    }),
    diagnostics.zsh,
    diagnostics.vale,
    diagnostics.ruff.with({
      condition = function(u)
	return utils.is_executable("ruff") and u.has_file("pyproject.toml")
      end,
    }),
    diagnostics.flake8.with({
      condition = function(u)
        return u.has_file(".flake8")
      end,
    }),
    diagnostics.mypy.with({
      -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      condition = function(u)
        return u.has_file("pyproject.toml")
      end,
      runtime_condition = function(params)
        return utils.path.exists(params.bufname)
      end,
    }),
    diagnostics.eslint_d.with({
      condition = function(u)
        return u.root_has_file(".eslintrc.js")
      end,
    }),
  },
  diagnostics_format = "[#{c}] #{m} (#{s})",
  temp_dir = "/tmp/null-ls/",
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == "null-ls"
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
  should_attach = function(bufnr)
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name:match("^git://") then
      return false
    elseif name:match("NvimTree") then
      return false
    elseif name:match("site%-packages") then
      return false
    end
    return true
  end,
})

vim.api.nvim_create_user_command("NullLsToggle", function()
  require("null-ls").toggle({})
end, {})
