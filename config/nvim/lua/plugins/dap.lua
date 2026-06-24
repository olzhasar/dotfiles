return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { "codelldb" },
      automatic_installation = true,
      handlers = {
        codelldb = function(config)
          config.configurations = {}
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      dap.configurations.c = {
        {
          name = "Launch lldb",
          type = "codelldb",
          request = "launch",
          program = function()
            local debug_target = vim.env.DEBUG_TARGET or "debug"
            local make = vim.fn.system({ "make", debug_target })
            if vim.v.shell_error ~= 0 then
              error("make " .. debug_target .. " failed:\n" .. make)
            end

            return vim.env.DEBUG_EXEC or "debug_exec"
          end,
          stopOnEntry = false,
          args = {},
        },
      }

      vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "DAP continue" })
      vim.keymap.set("n", "<leader>dC", dap.clear_breakpoints, { desc = "DAP clear breakpoints" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP breakpoint" })
      vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "DAP step over" })
      vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP step into" })
      vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "DAP step out" })
      vim.keymap.set("n", "<leader>dr", function()
        dap.repl.open(nil, "vsplit")
      end, { desc = "DAP REPL" })
      vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "DAP terminate" })
    end,
  },
}
