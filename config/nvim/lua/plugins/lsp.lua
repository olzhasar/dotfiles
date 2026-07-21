return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      keymap = {
        preset = "default",
        ["<C-h>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp" },
      },
      completion = {
        list = { selection = { preselect = false, auto_insert = true } },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 50,
        },
      },
      fuzzy = {
        implementation = "prefer_rust_with_warning",
      },
    },
  },
  { "williamboman/mason.nvim", opts = {} },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "html",
        "tailwindcss",
        "pyright",
        "clangd",
        "ts_ls",
        "lua_ls",
        "dockerls",
        "gopls",
        "jsonls",
        "sqlls",
        "yamlls",
        "ansiblels",
        "terraformls",
        "texlab",
        "bashls",
        "cssls",
        "htmx",
        "harper_ls",
        "ols",
        "zls",
      },
      -- auto-install configured servers (with lspconfig)
      -- do not auto-enable servers with default configs; we enable explicitly below
      automatic_enable = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gV", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "gs", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<Space>", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      end

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
          },
        },
        severity_sort = true,
      })

      -- Helper: merge a base config with per-server overrides
      local base = {
        on_attach = on_attach,
        capabilities = require("blink.cmp").get_lsp_capabilities(),
        -- Require a workspace/root for all servers by default (no rootless clients).
        workspace_required = true,
      }
      local function setup(server, extra)
        vim.lsp.config(server, vim.tbl_deep_extend("force", {}, base, extra or {}))
      end

      -- Simple servers
      setup("pyright", {
        workspace_required = true,
        settings = {
          ["pyright"] = {
            ["typeCheckingMode"] = "off",
          },
        },
      })
      -- setup("ty")
      setup("ruff")
      setup("html")
      setup("cssls")
      setup("dockerls")
      setup("zls")
      setup("gopls", {
        workspace_required = true,
      })
      setup("ts_ls", {
        workspace_required = true,
      })
      setup("clangd", {
        workspace_required = true,
      })
      setup("yamlls")
      setup("sqlls")
      setup("ansiblels")
      setup("terraformls")
      setup("texlab")

      local odin_root = vim.fn.systemlist({ "odin", "root" })[1]
      if odin_root and odin_root ~= "" then
        setup("ols", {
          workspace_required = true,
          init_options = {
            odin_command = vim.fn.exepath("odin"),
            collections = {
              { name = "core", path = vim.fs.joinpath(odin_root, "core") },
              { name = "shared", path = vim.fs.joinpath(odin_root, "shared") },
              { name = "vendor", path = vim.fs.joinpath(odin_root, "vendor") },
            },
          },
        })
      else
        setup("ols")
      end

      -- Per-server tweaks
      setup("harper_ls", {
        filetypes = { "markdown", "tex", "rst" },
        workspace_required = true,
      })

      setup("jsonls", {
        filetypes = { "json", "jsonc" },
      })

      setup("bashls", {
        filetypes = { "sh", "bash" },
      })

      setup("tailwindcss", {
        filetypes = { "html", "htmldjango", "javascript", "typescript", "vue" },
        workspace_required = true,
      })

      setup("htmx", {
        filetypes = { "html", "htmldjango" },
        workspace_required = true,
      })

      -- configure lua server (with special settings)
      setup("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- Finally: enable the configs (auto-activate by filetypes/root markers)

      vim.lsp.enable("html")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("clangd")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("dockerls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("sqlls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("ansiblels")
      vim.lsp.enable("terraformls")
      vim.lsp.enable("texlab")
      vim.lsp.enable("bashls")
      vim.lsp.enable("cssls")
      vim.lsp.enable("htmx")
      vim.lsp.enable("harper_ls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("ruff")
      vim.lsp.enable("zls")
      vim.lsp.enable("ols")
    end,
  },
}
