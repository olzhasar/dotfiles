local dark_colorscheme = "gruvbox"
local light_colorscheme = "catppuccin-latte"

local function set_colorscheme(scheme, bg)
  vim.cmd.colorscheme(scheme)
  vim.o.background = bg
end

local function switch_background()
  if vim.o.background == "dark" then
    set_colorscheme(light_colorscheme, "light")
  else
    set_colorscheme(dark_colorscheme, "dark")
  end
end

vim.api.nvim_create_user_command("BackgroundSwitch", switch_background, {})

set_colorscheme(dark_colorscheme, "dark")
