-- INIT
local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- PLUGINS
-- -- MLFlexer/smart_workspace_switcher.wezterm
-- local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
-- workspace_switcher.apply_to_config(config)
-- config.default_workspace = "~"
--
-- -- MLFlexer/smart_workspace_switcher.wezterm
-- local resurrect = wezterm.plugin.require("https://github.com/MLFlexer/resurrect.wezterm")

-- VISUAL
config.font_size = 18.0
config.font = wezterm.font_with_fallback({
	{ family = "Cica", weight = "Medium" },
	{ family = "JetBrains Mono", weight = "Medium" },
	"Noto Color Emoji",
})

config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
config.window_frame = {
	font = wezterm.font({ family = "Cica", weight = "Bold" }),
	font_size = 18,
}

config.color_scheme = "Catppuccin Latte"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false -- this must be false to use michaelbrusegard/tabline.wez
config.native_macos_fullscreen_mode = true
config.window_close_confirmation = "NeverPrompt"

--ENVIRONMENT
-- add homebrew bin path so that CMD+, opens WezTerm config with /opt/homebrew/bin/nvim
config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

-- KEYMAPS
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "p", mods = "CMD|SHIFT", action = wezterm.action.ActivateCommandPalette },
	{ key = "l", mods = "LEADER", action = wezterm.action.ShowLauncher },
	{
		key = ",",
		mods = "CMD",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
			args = { "nvim", wezterm.config_file },
		}),
	},
}

-- PLUGINS
-- -- tab bar plugin. this MUST come after color_scheme is set
-- local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
-- bar.apply_to_config(config, { position = "top" })

-- another tab bar plugin
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
	options = {
		theme = "Catppuccin Latte",
	},
})

return config
