local present, nvimtree = pcall(require, "nvim-tree")
if not present then
  return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  hijack_netrw = true,
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "<CR>", action = "edit_no_picker" },
        { key = "o", action = "edit_no_picker" },
        { key = "O", action = "edit" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  diagnostics = {
    enable = false,
  },
  git = {
    enable = false,
  },
  filters = {
    dotfiles = false,
    custom = {
      ".*.swp",
      ".*.pyc",
      ".pytest_cache",
      ".mypy_cache",
      "__pycache__",
      ".tags",
      "__tests__",
      ".DS_Store",
      "Session.vim",
      ".coverage",
    },
  },
})
