local function switch_background()
  if vim.o.background == "dark" then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end
end

vim.api.nvim_create_user_command("BackgroundSwitch", switch_background, {})

vim.g.light_colorscheme = "catppuccin-latte"
vim.g.dark_colorscheme = "gruvbox-material"

return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "mix"
      vim.cmd.colorscheme(vim.g.dark_colorscheme)
    end,
  },
  { "catppuccin/nvim", lazy = false },
  { "kyazdani42/nvim-web-devicons", lazy = true },
}
