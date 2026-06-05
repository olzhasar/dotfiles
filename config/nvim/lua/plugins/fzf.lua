return {
  { "junegunn/fzf" },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    init = function()
      vim.g.fzf_action = {
        ["ctrl-t"] = "tab split",
        ["ctrl-x"] = "split",
        ["ctrl-s"] = "split",
        ["ctrl-v"] = "vsplit",
      }
      vim.g.fzf_vim = {
        grep_multi_line = 0,
        preview_window = { "right,50%", "ctrl-/" },
      }
      vim.g.fzf_layout = {
        window = { width = 0.9, height = 0.75 },
      }
    end,
  },
}
