local M = {}

-- Cursor Dark (from Cursor's bundled VS Code theme)

local function clamp(x)
	if x < 0 then
		return 0
	end
	if x > 255 then
		return 255
	end
	return x
end

local function hex_to_rgb(hex)
	hex = hex:gsub("#", "")
	if #hex == 6 then
		return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16), 255
	end
	if #hex == 8 then
		return tonumber(hex:sub(1, 2), 16),
			tonumber(hex:sub(3, 4), 16),
			tonumber(hex:sub(5, 6), 16),
			tonumber(hex:sub(7, 8), 16)
	end
	return 0, 0, 0, 255
end

local function rgb_to_hex(r, g, b)
	return string.format("#%02X%02X%02X", clamp(r), clamp(g), clamp(b))
end

local function blend(fg, bg)
	-- fg may be #RRGGBB or #RRGGBBAA; bg is #RRGGBB
	local fr, fg_, fb, fa = hex_to_rgb(fg)
	local br, bg_, bb = hex_to_rgb(bg)
	local a = fa / 255
	local r = math.floor((1 - a) * br + a * fr + 0.5)
	local g = math.floor((1 - a) * bg_ + a * fg_ + 0.5)
	local b = math.floor((1 - a) * bb + a * fb + 0.5)
	return rgb_to_hex(r, g, b)
end

M.util = {
	blend = blend,
}

M.base = {
	bg = "#181818", -- editor.background
	bg_alt = "#141414", -- sideBar/backgrounds
	bg_hi = "#242424",

	fg = blend("#E4E4E4EB", "#181818"),
	fg_dim = blend("#E4E4E48D", "#181818"),
	fg_muted = blend("#E4E4E45E", "#181818"),

	border = blend("#E4E4E413", "#181818"),
	border_focus = blend("#E4E4E426", "#181818"),

	selection = blend("#40404099", "#181818"),
	selection_inactive = blend("#40404077", "#181818"),
	cursorline = "#262626",
	cursorline_nr = blend("#E4E4E4EB", "#181818"),

	pmenu = "#141414",
	pmenu_sel = "#343434",

	-- Accents / ANSI (from terminal.*)
	red = "#FC6B83",
	red_dark = "#E34671",
	green = "#3FA266",
	green_bright = "#70B489",
	yellow = "#F1B467",
	orange = "#D2943E",
	blue = "#81A1C1",
	blue_bright = "#87A6C4",
	cyan = "#88C0D0",
	magenta = "#B48EAD",

	-- Syntax (from tokenColors / semanticTokenColors)
	comment = blend("#E4E4E45E", "#181818"),
	string = "#E394DC",
	number = "#EBC88D",
	constant = "#F8C762",
	keyword = "#82D2CE",
	func_call = "#EBC88D",
	func_decl = "#EFB080",
	type = "#87C3FF",
	property = "#AAA0FA",

	-- Additional semantic token colors
	variable = "#9CDCFE", -- light blue for variables (VS Code style)
	variable_readonly = "#9CDCFE",
	self_param = "#CC7C8A",
	decorator = "#A8CC7C",
	macro = "#A8CC7C",
	enum_member = "#D6D6DD",

	-- Token colors for messages
	error = "#F14C4C",
	info = "#AAA0FA",
	warn = "#F8C762",
	debug = "#82D2CE",

	-- Links
	link = "#81A1C1",
	link_active = "#87A6C4",

	-- Git decorations
	git_added = "#70B489",
	git_modified = "#F1B467",
	git_deleted = "#FC6B83",
	git_untracked = "#88C0D0",
	git_ignored = blend("#E4E4E45E", "#181818"),

	-- Additional UI colors
	whitespace = blend("#505050B3", "#181818"),
	ruler = blend("#E4E4E442", "#181818"),
	bracket_match = blend("#E4E4E41E", "#181818"),
	word_highlight = blend("#E4E4E41E", "#181818"),
	word_highlight_strong = blend("#E4E4E430", "#181818"),
}

M.terminal = {
	black = "#242424",
	red = "#FC6B83",
	green = "#3FA266",
	yellow = "#D2943E",
	blue = "#81A1C1",
	magenta = "#B48EAD",
	cyan = "#88C0D0",
	white = "#E4E4E4",

	bright_black = blend("#E4E4E442", "#141414"),
	bright_red = "#FC6B83",
	bright_green = "#70B489",
	bright_yellow = "#F1B467",
	bright_blue = "#87A6C4",
	bright_magenta = "#B48EAD",
	bright_cyan = "#88C0D0",
	bright_white = "#E4E4E4",
}

return M
