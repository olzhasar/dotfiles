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
})

telescope.load_extension("fzf")
