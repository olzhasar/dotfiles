return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-fzf-native.nvim" },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-J>"] = actions.move_selection_next,
              ["<C-K>"] = actions.move_selection_previous,
              ["<C-S>"] = actions.select_horizontal,
              ["<C-Q>"] = actions.smart_send_to_qflist + actions.open_qflist,
              ["<C-A>"] = actions.select_all,
              ["<C-D>"] = actions.drop_all,
            },
          },
        },
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
        },
      })
      telescope.load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
}
