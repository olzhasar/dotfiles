return {
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
        -- "ty",
        "bashls",
        "cssls",
        "htmx",
        "harper_ls",
      },
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "onsails/lspkind.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- enable keybinds only for when lsp server available
      local on_attach = function(_, _)
        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "gs", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        vim.keymap.set("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
        vim.keymap.set("n", "<leader>o", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
        vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
        vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        vim.keymap.set("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
          },
          linehl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          },
        },
        severity_sort = true,
      })

      -- Helper: merge a base config with per-server overrides
      local base = {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      local function setup(server, extra)
        vim.lsp.config(server, vim.tbl_deep_extend("force", {}, base, extra or {}))
      end

      -- Simple servers
      setup("pyright", {
        settings = {
          ["pyright"] = {
            ["typeCheckingMode"] = "off",
          },
        },
      })
      -- setup("ty")
      setup("harper_ls")
      setup("ruff")
      setup("html")
      setup("cssls")
      setup("dockerls")
      setup("gopls")
      setup("ts_ls")
      setup("clangd")
      setup("yamlls")
      setup("sqlls")
      setup("ansiblels")
      setup("terraformls")
      setup("texlab")

      -- Per-server tweaks
      setup("jsonls", {
        filetypes = { "json", "jsonc" },
      })

      setup("bashls", {
        filetypes = { "sh", "bash" },
      })

      setup("tailwindcss", {
        filetypes = { "html", "htmldjango", "javascript", "typescript", "vue" },
      })

      setup("htmx", {
        filetypes = { "html", "htmldjango" },
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
      vim.lsp.enable("ty")
      vim.lsp.enable("ruff")
    end,
  },
}
