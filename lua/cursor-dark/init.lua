local M = {}

local function clear_loaded()
	for name, _ in pairs(package.loaded) do
		if name:match("^cursor%-dark") then
			package.loaded[name] = nil
		end
	end
end

local function colorscheme_paths()
	return vim.fn.globpath(vim.o.runtimepath, "colors/cursor-dark.lua", false, true)
end

local function ensure_commands()
	if vim.g._cursor_dark_commands then
		return
	end
	vim.g._cursor_dark_commands = true

	vim.api.nvim_create_user_command("CursorDarkReload", function()
		clear_loaded()
		vim.cmd.colorscheme("cursor-dark")
	end, {})

	vim.api.nvim_create_user_command("CursorDarkInfo", function()
		local paths = colorscheme_paths()
		local msg = {
			"colors_name=" .. tostring(vim.g.colors_name),
			"rtp colors/cursor-dark.lua:",
		}
		for _, p in ipairs(paths) do
			table.insert(msg, "- " .. p)
		end
		vim.notify(table.concat(msg, "\n"), vim.log.levels.INFO)
	end, {})
end

function M.load()
	ensure_commands()

	if vim.g.colors_name then
		vim.cmd("hi clear")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "cursor-dark"
	vim.g.cursor_dark_version = "dev"

	require("cursor-dark.theme").apply()
end

return M
