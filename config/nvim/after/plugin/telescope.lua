local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-J>"] = actions.move_selection_next,
        ["<C-K>"] = actions.move_selection_previous,
        ["<C-Q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")
