local setup, null_ls = pcall(require, "null-ls")
if not setup then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local log = require("null-ls.logger")
local h = require("null-ls.helpers")
local utils = require("null-ls.utils")

local overrides = {
  severities = {
    error = h.diagnostics.severities["error"],
    warning = h.diagnostics.severities["warning"],
    note = h.diagnostics.severities["information"],
  },
}

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
  -- setup formatters & linters
  sources = {
    formatting.prettier.with({ disabled_filetypes = { "yaml" } }),
    formatting.stylua, -- lua formatter
    formatting.djhtml, -- format jinja, django templates
    formatting.black.with({
      condition = function(u)
        return u.root_has_file("pyproject.toml")
      end,
    }),
    diagnostics.actionlint, -- lint github workflow files
    diagnostics.zsh,
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
      generator_opts = {
        command = "mypy",
        args = function(params)
          return {
            "--hide-error-codes",
            "--hide-error-context",
            "--no-color-output",
            "--show-column-numbers",
            "--show-error-codes",
            "--no-error-summary",
            "--no-pretty",
            "--shadow-file",
            params.bufname,
            params.temp_path,
            params.bufname,
          }
        end,
        to_temp_file = true,
        format = "line",
        check_exit_code = function(code)
          return code <= 2
        end,
        multiple_files = false,
        on_output = h.diagnostics.from_patterns({
          -- see spec for pattern examples
          {
            pattern = "([^:]+):(%d+):(%d+): (%a+): (.*)  %[([%a-]+)%]",
            groups = { "filename", "row", "col", "severity", "message", "code" },
            overrides = overrides,
          },
          -- no error code
          {
            pattern = "([^:]+):(%d+):(%d+): (%a+): (.*)",
            groups = { "filename", "row", "col", "severity", "message" },
            overrides = overrides,
          },
          -- no column or error code
          {
            pattern = "([^:]+):(%d+): (%a+): (.*)",
            groups = { "filename", "row", "severity", "message" },
            overrides = overrides,
          },
        }),
        cwd = h.cache.by_bufnr(function(params)
          return utils.root_pattern(
            -- https://mypy.readthedocs.io/en/stable/config_file.html
            "mypy.ini",
            ".mypy.ini",
            "pyproject.toml",
            "setup.cfg"
          )(params.bufname)
        end),
      },
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
    return utils.path.exists(name)
  end,
})
