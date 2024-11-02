local wezterm = require("wezterm")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
	config:set_strict_mode(true)
end

config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.tab_bar_at_bottom = true

config.color_scheme = "tokyonight_night"
config.font = wezterm.font("CaskaydiaCove NF")

-- Default shell is cmd, change it to PSCore
config.default_prog = { "pwsh.exe", "-NoLogo" }

-- config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

local action = wezterm.action
config.keys = {
	{
		key = "_",
		mods = "SHIFT|ALT",
		action = action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
}

config.initial_cols = 170
config.initial_rows = 51

return config
