local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
-- local log = require("null-ls.logger")
local utils = require("null-ls.utils")

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
  -- setup formatters & linters
  sources = {
    hover.dictionary,
    formatting.prettier.with({ disabled_filetypes = { "yaml" } }),
    formatting.stylua, -- lua formatter
    formatting.djhtml, -- format jinja, django templates
    formatting.gofmt,
    formatting.clang_format,
    formatting.black.with({
      condition = function(u)
        return u.root_has_file("pyproject.toml")
      end,
    }),
    diagnostics.actionlint, -- lint github workflow files
    diagnostics.zsh,
    diagnostics.vale,
    formatting.isort.with({
      condition = function(u)
        return u.root_has_file("pyproject.toml")
      end,
    }),
    diagnostics.flake8.with({
      condition = function(u)
        return u.root_has_file(".flake8")
      end,
    }),
    diagnostics.mypy.with({
      -- method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
      condition = function(u)
        return u.root_has_file("pyproject.toml")
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
