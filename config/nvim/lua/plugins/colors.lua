local function switch_background()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

vim.api.nvim_create_user_command("BackgroundSwitch", switch_background, {})

return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "mix"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  { "catppuccin/nvim", lazy = true },
  { "kyazdani42/nvim-web-devicons", lazy = true },
}
