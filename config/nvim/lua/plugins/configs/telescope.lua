local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local actions_present, actions = pcall(require, "telescope.actions")
if not actions_present then
  return
end

telescope.setup{
  defaults = {
    mappings = {
      i = {
	["<C-J>"] = actions.move_selection_next,
	["<C-K>"] = actions.move_selection_previous,
      },
    },
  }
}
