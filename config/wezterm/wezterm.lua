local wezterm = require 'wezterm'

return {
  -- Font rendering (pairs well with your fontconfig)
  -- font_size = 12,

  -- Gruvbox (built-in)
  -- color_scheme = 'Gruvbox dark, hard (base16)',

  color_scheme = "gruvbox_material_dark_hard",
  color_schemes = {
    ["gruvbox_material_dark_hard"] = {
      foreground = "#D4BE98",
      background = "#1D2021",
      cursor_bg = "#D4BE98",
      cursor_border = "#D4BE98",
      cursor_fg = "#1D2021",
      selection_bg = "#D4BE98" ,
      selection_fg = "#3C3836",

      ansi = {"#1d2021","#ea6962","#a9b665","#d8a657", "#7daea3","#d3869b", "#89b482","#d4be98"},
      brights = {"#eddeb5","#ea6962","#a9b665","#d8a657", "#7daea3","#d3869b", "#89b482","#d4be98"},
    },
  },


  -- Remove tab bar completely
  enable_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,

  -- Wayland-friendly defaults
  use_fancy_tab_bar = false,

  -- Optional: make background fully opaque (no blur / transparency)
  window_background_opacity = 1.0,

  window_padding = {
    left = 0,
    right = 0,
    top = "4px",
    bottom = "4px",
  }
}
