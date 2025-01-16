local wezterm = require("wezterm")
local commands = require("commands")
local config = wezterm.config_builder()

-- << Linux / WezTerm Specific Settings >>
-- removing annoying messages about fonts
config.warn_about_missing_glyphs = false
-- make wezterm run on Wayland Compositor
config.enable_wayland = false

-- << Performance >>
config.max_fps = 120

-- << Appearance >>
config.color_scheme = "OneHalfDark"
config.window_background_opacity = 0.6

-- << Font >>
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 14

-- << Cursor / Caret >>
config.colors = {
    cursor_bg = "#bbc2cf",
    cursor_border = "#bbc2cf"
}

-- << Window / Tabs >>
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 2,
  right = 0,
  top = 2,
  bottom = 0,
}

-- << Custom Commands >>
wezterm.on("augment-command-palette", function()
    return commands
end)

return config
