local palette = require("cursor-dark.palette")

local M = {}

local function hl(group, spec)
	vim.api.nvim_set_hl(0, group, spec)
end

local function set_terminal_colors(p)
	vim.g.terminal_color_0 = p.black
	vim.g.terminal_color_1 = p.red
	vim.g.terminal_color_2 = p.green
	vim.g.terminal_color_3 = p.yellow
	vim.g.terminal_color_4 = p.blue
	vim.g.terminal_color_5 = p.magenta
	vim.g.terminal_color_6 = p.cyan
	vim.g.terminal_color_7 = p.white
	vim.g.terminal_color_8 = p.bright_black
	vim.g.terminal_color_9 = p.bright_red
	vim.g.terminal_color_10 = p.bright_green
	vim.g.terminal_color_11 = p.bright_yellow
	vim.g.terminal_color_12 = p.bright_blue
	vim.g.terminal_color_13 = p.bright_magenta
	vim.g.terminal_color_14 = p.bright_cyan
	vim.g.terminal_color_15 = p.bright_white
end

function M.apply()
	local c = palette.base

	-- Core UI
	hl("Normal", { fg = c.fg, bg = c.bg })
	hl("NormalNC", { fg = c.fg, bg = c.bg })
	hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
	hl("FloatBorder", { fg = c.border, bg = c.bg_alt })
	hl("WinSeparator", { fg = c.border, bg = c.bg })

	hl("CursorLine", { bg = c.cursorline })
	hl("CursorColumn", { bg = c.cursorline })
	hl("ColorColumn", { bg = c.cursorline })

	hl("LineNr", { fg = c.fg_muted })
	hl("CursorLineNr", { fg = c.cursorline_nr, bg = c.cursorline })
	hl("SignColumn", { fg = c.fg_dim, bg = c.bg })
	hl("Folded", { fg = c.fg_dim, bg = c.bg_alt })
	hl("FoldColumn", { fg = c.fg_muted, bg = c.bg })

	hl("Visual", { bg = c.selection })
	hl("VisualNOS", { bg = c.selection_inactive })
	hl("Search", { bg = palette.util.blend("#88C0D066", c.bg), fg = c.bg })
	hl("IncSearch", { bg = palette.util.blend("#88C0D0AA", c.bg), fg = c.bg })

	hl("Pmenu", { fg = c.fg, bg = c.pmenu })
	hl("PmenuSel", { fg = c.fg, bg = c.pmenu_sel })
	hl("PmenuSbar", { bg = palette.util.blend("#E4E4E411", c.bg) })
	hl("PmenuThumb", { bg = palette.util.blend("#E4E4E41E", c.bg) })

	hl("StatusLine", { fg = c.fg_dim, bg = c.bg_alt })
	hl("StatusLineNC", { fg = c.fg_muted, bg = c.bg_alt })
	hl("TabLine", { fg = c.fg_muted, bg = c.bg })
	hl("TabLineSel", { fg = c.fg, bg = c.bg })
	hl("TabLineFill", { fg = c.fg_muted, bg = c.bg })

	hl("Directory", { fg = c.cyan })
	hl("Title", { fg = c.fg, bold = true })

	hl("MatchParen", { bg = palette.util.blend("#E4E4E41E", c.bg), bold = true })

	-- Cursor
	hl("Cursor", { fg = c.bg, bg = c.fg })
	hl("lCursor", { fg = c.bg, bg = c.fg })
	hl("CursorIM", { fg = c.bg, bg = c.fg })
	hl("TermCursor", { fg = c.bg, bg = c.fg })
	hl("TermCursorNC", { fg = c.bg, bg = c.fg_dim })

	-- Whitespace & Non-text
	hl("NonText", { fg = c.fg_muted })
	hl("EndOfBuffer", { fg = c.bg })
	hl("Whitespace", { fg = c.whitespace })
	hl("SpecialKey", { fg = c.fg_muted })
	hl("Conceal", { fg = c.fg_dim })

	-- Messages / prompts
	hl("ErrorMsg", { fg = c.red })
	hl("WarningMsg", { fg = c.yellow })
	hl("MoreMsg", { fg = c.green_bright })
	hl("Question", { fg = c.cyan })
	hl("ModeMsg", { fg = c.fg, bold = true })
	hl("MsgArea", { fg = c.fg })
	hl("MsgSeparator", { fg = c.border })

	-- Spell checking
	hl("SpellBad", { sp = c.red, undercurl = true })
	hl("SpellCap", { sp = c.yellow, undercurl = true })
	hl("SpellLocal", { sp = c.cyan, undercurl = true })
	hl("SpellRare", { sp = c.magenta, undercurl = true })

	-- Other UI
	hl("WildMenu", { fg = c.fg, bg = c.pmenu_sel })
	hl("QuickFixLine", { bg = c.selection })
	hl("VertSplit", { link = "WinSeparator" })
	hl("Substitute", { fg = c.bg, bg = c.yellow })

	-- Diff
	hl("DiffAdd", { bg = palette.util.blend("#3FA26633", c.bg) })
	hl("DiffChange", { bg = palette.util.blend("#88C0D04D", c.bg) })
	hl("DiffDelete", { bg = palette.util.blend("#B8004933", c.bg) })
	hl("DiffText", { bg = palette.util.blend("#88C0D066", c.bg), bold = true })

	-- Syntax (classic)
	hl("Comment", { fg = c.comment, italic = true })
	hl("String", { fg = c.string })
	hl("Character", { fg = c.string })
	hl("Number", { fg = c.number })
	hl("Boolean", { fg = c.keyword })
	hl("Float", { fg = c.number })

	hl("Identifier", { fg = c.variable })
	hl("Function", { fg = c.func_call })

	hl("Statement", { fg = c.keyword })
	hl("Conditional", { fg = c.keyword })
	hl("Repeat", { fg = c.keyword })
	hl("Label", { fg = c.keyword })
	hl("Operator", { fg = c.fg_dim })
	hl("Keyword", { fg = c.keyword })
	hl("Exception", { fg = c.keyword })

	hl("PreProc", { fg = c.green_bright })
	hl("Include", { fg = c.green_bright, italic = true })
	hl("Define", { fg = c.green_bright })
	hl("Macro", { fg = c.green_bright })

	hl("Type", { fg = c.type })
	hl("StorageClass", { fg = c.keyword })
	hl("Structure", { fg = c.type })
	hl("Typedef", { fg = c.type })

	hl("Special", { fg = c.constant })
	hl("SpecialChar", { fg = c.constant })
	hl("Tag", { fg = c.property })
	hl("Delimiter", { fg = c.fg_dim })
	hl("SpecialComment", { fg = c.comment })
	hl("Debug", { fg = c.cyan })

	hl("Underlined", { underline = true })

	-- Diagnostics (LSP)
	hl("DiagnosticError", { fg = c.red })
	hl("DiagnosticWarn", { fg = c.yellow })
	hl("DiagnosticInfo", { fg = c.cyan })
	hl("DiagnosticHint", { fg = c.fg_dim })

	hl("DiagnosticUnderlineError", { sp = c.red, undercurl = true })
	hl("DiagnosticUnderlineWarn", { sp = c.yellow, undercurl = true })
	hl("DiagnosticUnderlineInfo", { sp = c.cyan, undercurl = true })
	hl("DiagnosticUnderlineHint", { sp = c.fg_dim, undercurl = true })

	-- Diagnostic virtual text
	hl("DiagnosticVirtualTextError", { fg = c.red_dark, italic = true })
	hl("DiagnosticVirtualTextWarn", { fg = c.orange, italic = true })
	hl("DiagnosticVirtualTextInfo", { fg = c.cyan, italic = true })
	hl("DiagnosticVirtualTextHint", { fg = c.fg_muted, italic = true })

	-- Diagnostic floating windows
	hl("DiagnosticFloatingError", { fg = c.red })
	hl("DiagnosticFloatingWarn", { fg = c.yellow })
	hl("DiagnosticFloatingInfo", { fg = c.cyan })
	hl("DiagnosticFloatingHint", { fg = c.fg_dim })

	-- Diagnostic signs
	hl("DiagnosticSignError", { fg = c.red })
	hl("DiagnosticSignWarn", { fg = c.yellow })
	hl("DiagnosticSignInfo", { fg = c.cyan })
	hl("DiagnosticSignHint", { fg = c.fg_dim })

	-- Treesitter / LSP semantic tokens
	hl("@comment", { link = "Comment" })
	hl("@string", { link = "String" })
	hl("@string.documentation", { fg = c.string, italic = true })
	hl("@character", { link = "Character" })
	hl("@number", { link = "Number" })
	hl("@boolean", { link = "Boolean" })

	hl("@function", { fg = c.func_call })
	hl("@function.call", { fg = c.func_call })
	hl("@function.builtin", { fg = c.keyword })
	hl("@function.definition", { fg = c.func_decl, bold = true })

	hl("@method", { fg = c.func_call })
	hl("@method.call", { fg = c.func_call })
	hl("@method.definition", { fg = c.func_decl, bold = true })

	hl("@constructor", { fg = c.func_decl })

	-- Cursor highlights class/type references with warm peachy color (like func_decl)
	-- Type definitions are blue, builtin types are also blue
	hl("@type", { fg = c.func_decl })
	hl("@type.definition", { fg = c.type })
	hl("@type.builtin", { fg = c.type })

	hl("@keyword", { fg = c.keyword })
	hl("@keyword.import", { fg = c.keyword, italic = true })
	hl("@keyword.return", { fg = c.keyword, italic = true })
	hl("@keyword.conditional", { fg = c.keyword, italic = true })
	hl("@keyword.repeat", { fg = c.keyword, italic = true })
	hl("@keyword.exception", { fg = c.keyword, italic = true })
	hl("@keyword.coroutine", { fg = c.keyword, italic = true })

	hl("@constant", { fg = c.property })
	hl("@constant.builtin", { fg = c.keyword })

	hl("@property", { fg = c.property })
	hl("@field", { fg = c.property })
	hl("@variable", { fg = c.variable })
	hl("@variable.builtin", { fg = c.self_param, italic = true })
	hl("@parameter", { fg = c.fg, italic = true })

	-- Module/namespace paths - white in Cursor, not dimmed
	hl("@module", { fg = c.fg })
	hl("@module.python", { fg = c.fg })
	hl("@namespace", { fg = c.fg })
	hl("@module.builtin", { fg = c.fg })
	hl("@include", { fg = c.keyword, italic = true })

	-- Attributes & Labels (decorators are yellow/golden in Cursor)
	hl("@attribute", { fg = c.func_call })
	hl("@attribute.python", { fg = c.func_call })
	hl("@label", { fg = c.keyword })

	-- Strings (extended)
	hl("@string.escape", { fg = c.constant })
	hl("@string.regex", { fg = c.constant })
	hl("@string.special", { fg = c.constant })
	hl("@string.special.url", { fg = c.link, underline = true })
	hl("@string.special.path", { fg = c.cyan })

	-- Text/Markup
	hl("@text", { fg = c.fg })
	hl("@text.strong", { fg = c.fg, bold = true })
	hl("@text.emphasis", { fg = c.fg, italic = true })
	hl("@text.underline", { underline = true })
	hl("@text.strike", { strikethrough = true })
	hl("@text.title", { fg = c.fg, bold = true })
	hl("@text.literal", { fg = c.string })
	hl("@text.uri", { fg = c.link, underline = true })
	hl("@text.reference", { fg = c.property })
	hl("@text.todo", { fg = c.cyan, bold = true })
	hl("@text.note", { fg = c.info, bold = true })
	hl("@text.warning", { fg = c.warn, bold = true })
	hl("@text.danger", { fg = c.error, bold = true })

	-- Markup (newer captures)
	hl("@markup.strong", { fg = c.fg, bold = true })
	hl("@markup.italic", { fg = c.fg, italic = true })
	hl("@markup.strikethrough", { strikethrough = true })
	hl("@markup.underline", { underline = true })
	hl("@markup.heading", { fg = c.fg, bold = true })
	hl("@markup.heading.1", { fg = c.red, bold = true })
	hl("@markup.heading.2", { fg = c.yellow, bold = true })
	hl("@markup.heading.3", { fg = c.green_bright, bold = true })
	hl("@markup.heading.4", { fg = c.cyan, bold = true })
	hl("@markup.heading.5", { fg = c.blue, bold = true })
	hl("@markup.heading.6", { fg = c.magenta, bold = true })
	hl("@markup.quote", { fg = c.fg_dim, italic = true })
	hl("@markup.math", { fg = c.number })
	hl("@markup.link", { fg = c.link })
	hl("@markup.link.label", { fg = c.property })
	hl("@markup.link.url", { fg = c.link, underline = true })
	hl("@markup.raw", { fg = c.green_bright })
	hl("@markup.raw.block", { fg = c.green_bright })
	hl("@markup.raw.delimiter", { fg = c.fg_muted })
	hl("@markup.list", { fg = c.keyword })
	hl("@markup.list.checked", { fg = c.green_bright })
	hl("@markup.list.unchecked", { fg = c.fg_muted })

	-- Punctuation (detailed) - slightly dimmer to reduce whiteness
	hl("@punctuation", { fg = c.fg_dim })
	hl("@punctuation.bracket", { fg = c.fg_dim })
	hl("@punctuation.delimiter", { fg = c.fg_dim })
	hl("@punctuation.special", { fg = c.keyword })

	hl("@operator", { link = "Operator" })

	-- Tags (HTML/JSX)
	hl("@tag", { fg = c.type })
	hl("@tag.attribute", { fg = c.property, italic = true })
	hl("@tag.delimiter", { fg = c.fg_dim })
	hl("@tag.builtin", { fg = c.keyword })

	-- Variables (extended)
	hl("@variable.member", { fg = c.property })
	hl("@variable.parameter", { fg = c.fg, italic = true })
	hl("@variable.parameter.builtin", { fg = c.fg, italic = true })

	-- Language-specific
	hl("@type.qualifier", { fg = c.keyword })
	hl("@storageclass", { fg = c.keyword })
	hl("@define", { fg = c.decorator })
	hl("@preproc", { fg = c.decorator })

	-- Additional captures
	hl("@error", { fg = c.red })
	hl("@diff.plus", { fg = c.git_added })
	hl("@diff.minus", { fg = c.git_deleted })
	hl("@diff.delta", { fg = c.git_modified })

	-- LSP semantic token groups (Neovim 0.9+)
	hl("@lsp.type.function", { fg = c.func_call })
	hl("@lsp.type.method", { fg = c.func_call })
	hl("@lsp.type.parameter", { fg = c.fg, italic = true })
	hl("@lsp.type.property", { fg = c.property })
	hl("@lsp.type.variable", { fg = c.variable })
	-- LSP semantic tokens: type/class refs are peachy (func_decl), definitions are blue
	hl("@lsp.type.type", { fg = c.func_decl })
	hl("@lsp.type.class", { fg = c.func_decl })
	hl("@lsp.typemod.type.declaration", { fg = c.type })
	hl("@lsp.typemod.class.declaration", { fg = c.type })
	hl("@lsp.typemod.class.definition", { fg = c.type })
	hl("@lsp.type.namespace", { fg = c.fg })
	hl("@lsp.type.module", { fg = c.fg })

	-- Additional LSP types (references are peachy, definitions handled by typemod)
	hl("@lsp.type.enum", { fg = c.func_decl })
	hl("@lsp.type.enumMember", { fg = c.constant })
	hl("@lsp.type.interface", { fg = c.func_decl })
	hl("@lsp.type.struct", { fg = c.func_decl })
	hl("@lsp.type.decorator", { fg = c.func_call })
	hl("@lsp.type.macro", { fg = c.decorator })
	hl("@lsp.type.comment", { link = "Comment" })
	hl("@lsp.type.string", { link = "String" })
	hl("@lsp.type.number", { link = "Number" })
	hl("@lsp.type.keyword", { fg = c.keyword })
	hl("@lsp.type.operator", { link = "Operator" })
	hl("@lsp.type.event", { fg = c.property })
	hl("@lsp.type.modifier", { fg = c.keyword })
	hl("@lsp.type.regexp", { fg = c.constant })
	hl("@lsp.type.typeParameter", { fg = c.type, italic = true })

	-- LSP modifiers
	hl("@lsp.typemod.function.declaration", { fg = c.func_decl, bold = true })
	hl("@lsp.typemod.function.definition", { fg = c.func_decl, bold = true })
	hl("@lsp.typemod.method.declaration", { fg = c.func_decl, bold = true })
	hl("@lsp.typemod.method.definition", { fg = c.func_decl, bold = true })
	hl("@lsp.typemod.variable.readonly", { fg = c.property })
	hl("@lsp.typemod.variable.global", { fg = c.variable })
	hl("@lsp.typemod.variable.defaultLibrary", { fg = c.variable })
	hl("@lsp.typemod.parameter.declaration", { fg = c.fg, italic = true })
	hl("@lsp.typemod.property.readonly", { fg = c.property })
	hl("@lsp.mod.deprecated", { strikethrough = true })
	hl("@lsp.mod.readonly", { fg = c.property })
	hl("@lsp.mod.defaultLibrary", { fg = c.fg })
	hl("@lsp.mod.async", { italic = true })

	-- Python-specific: self/cls parameter (Pyright/Pylance semantic token)
	hl("@lsp.type.selfParameter", { fg = c.self_param, italic = true })
	hl("@lsp.type.clsParameter", { fg = c.self_param, italic = true })

	-- Legacy Tree-sitter highlight groups (older setups)
	hl("TSComment", { link = "Comment" })
	hl("TSString", { link = "String" })
	hl("TSNumber", { link = "Number" })
	hl("TSBoolean", { link = "Boolean" })
	hl("TSKeyword", { link = "Keyword" })
	hl("TSKeywordFunction", { fg = c.keyword, italic = true })
	hl("TSFunction", { fg = c.func_call })
	hl("TSMethod", { fg = c.func_call })
	hl("TSType", { fg = c.func_decl })
	hl("TSTypeBuiltin", { fg = c.type })
	hl("TSField", { fg = c.property })
	hl("TSProperty", { fg = c.property })
	hl("TSParameter", { fg = c.fg, italic = true })
	hl("TSOperator", { link = "Operator" })

	-- ============================================
	-- Plugin Support
	-- ============================================

	-- Telescope
	hl("TelescopeNormal", { fg = c.fg, bg = c.bg_alt })
	hl("TelescopeBorder", { fg = c.border, bg = c.bg_alt })
	hl("TelescopeSelection", { bg = c.pmenu_sel })
	hl("TelescopePromptNormal", { fg = c.fg, bg = c.bg })
	hl("TelescopePromptBorder", { fg = c.border, bg = c.bg })
	hl("TelescopePromptTitle", { fg = c.cyan, bold = true })
	hl("TelescopePromptPrefix", { fg = c.cyan })
	hl("TelescopePromptCounter", { fg = c.fg_muted })
	hl("TelescopeResultsNormal", { fg = c.fg, bg = c.bg_alt })
	hl("TelescopeResultsBorder", { fg = c.border, bg = c.bg_alt })
	hl("TelescopeResultsTitle", { fg = c.fg_dim })
	hl("TelescopePreviewNormal", { fg = c.fg, bg = c.bg_alt })
	hl("TelescopePreviewBorder", { fg = c.border, bg = c.bg_alt })
	hl("TelescopePreviewTitle", { fg = c.fg_dim })
	hl("TelescopeMatching", { fg = c.cyan, bold = true })
	hl("TelescopeSelectionCaret", { fg = c.cyan })

	-- nvim-cmp
	hl("CmpItemAbbr", { fg = c.fg })
	hl("CmpItemAbbrMatch", { fg = c.cyan, bold = true })
	hl("CmpItemAbbrDeprecated", { fg = c.fg_muted, strikethrough = true })
	hl("CmpItemAbbrMatchFuzzy", { fg = c.cyan })
	hl("CmpItemKindFunction", { fg = c.func_call })
	hl("CmpItemKindMethod", { fg = c.func_call })
	hl("CmpItemKindVariable", { fg = c.fg })
	hl("CmpItemKindKeyword", { fg = c.keyword })
	hl("CmpItemKindClass", { fg = c.type })
	hl("CmpItemKindInterface", { fg = c.type })
	hl("CmpItemKindStruct", { fg = c.type })
	hl("CmpItemKindEnum", { fg = c.type })
	hl("CmpItemKindEnumMember", { fg = c.constant })
	hl("CmpItemKindModule", { fg = c.fg_dim })
	hl("CmpItemKindProperty", { fg = c.property })
	hl("CmpItemKindField", { fg = c.property })
	hl("CmpItemKindConstant", { fg = c.constant })
	hl("CmpItemKindSnippet", { fg = c.magenta })
	hl("CmpItemKindText", { fg = c.fg })
	hl("CmpItemKindFile", { fg = c.fg })
	hl("CmpItemKindFolder", { fg = c.cyan })
	hl("CmpItemKindUnit", { fg = c.number })
	hl("CmpItemKindValue", { fg = c.number })
	hl("CmpItemKindEvent", { fg = c.property })
	hl("CmpItemKindOperator", { fg = c.fg })
	hl("CmpItemKindTypeParameter", { fg = c.type })
	hl("CmpItemKindReference", { fg = c.fg_dim })
	hl("CmpItemMenu", { fg = c.fg_muted })

	-- GitSigns
	hl("GitSignsAdd", { fg = c.git_added })
	hl("GitSignsChange", { fg = c.git_modified })
	hl("GitSignsDelete", { fg = c.git_deleted })
	hl("GitSignsAddNr", { fg = c.git_added })
	hl("GitSignsChangeNr", { fg = c.git_modified })
	hl("GitSignsDeleteNr", { fg = c.git_deleted })
	hl("GitSignsAddLn", { bg = palette.util.blend("#70B48922", c.bg) })
	hl("GitSignsChangeLn", { bg = palette.util.blend("#F1B46722", c.bg) })
	hl("GitSignsDeleteLn", { bg = palette.util.blend("#FC6B8322", c.bg) })
	hl("GitSignsCurrentLineBlame", { fg = c.fg_muted, italic = true })

	-- NvimTree
	hl("NvimTreeNormal", { fg = c.fg_dim, bg = c.bg_alt })
	hl("NvimTreeNormalNC", { fg = c.fg_dim, bg = c.bg_alt })
	hl("NvimTreeFolderIcon", { fg = c.cyan })
	hl("NvimTreeFolderName", { fg = c.cyan })
	hl("NvimTreeOpenedFolderName", { fg = c.cyan, bold = true })
	hl("NvimTreeEmptyFolderName", { fg = c.fg_muted })
	hl("NvimTreeRootFolder", { fg = c.fg_muted, bold = true })
	hl("NvimTreeGitDirty", { fg = c.git_modified })
	hl("NvimTreeGitNew", { fg = c.git_untracked })
	hl("NvimTreeGitDeleted", { fg = c.git_deleted })
	hl("NvimTreeGitStaged", { fg = c.git_added })
	hl("NvimTreeSpecialFile", { fg = c.constant, underline = true })
	hl("NvimTreeIndentMarker", { fg = c.border })
	hl("NvimTreeImageFile", { fg = c.magenta })
	hl("NvimTreeWindowPicker", { fg = c.bg, bg = c.cyan, bold = true })

	-- Neo-tree
	hl("NeoTreeNormal", { fg = c.fg_dim, bg = c.bg_alt })
	hl("NeoTreeNormalNC", { fg = c.fg_dim, bg = c.bg_alt })
	hl("NeoTreeDirectoryName", { fg = c.cyan })
	hl("NeoTreeDirectoryIcon", { fg = c.cyan })
	hl("NeoTreeRootName", { fg = c.fg_muted, bold = true })
	hl("NeoTreeGitAdded", { fg = c.git_added })
	hl("NeoTreeGitModified", { fg = c.git_modified })
	hl("NeoTreeGitDeleted", { fg = c.git_deleted })
	hl("NeoTreeGitUntracked", { fg = c.git_untracked })
	hl("NeoTreeGitIgnored", { fg = c.git_ignored })
	hl("NeoTreeIndentMarker", { fg = c.border })
	hl("NeoTreeFloatBorder", { fg = c.border, bg = c.bg_alt })
	hl("NeoTreeFloatTitle", { fg = c.cyan, bold = true })

	-- indent-blankline
	hl("IblIndent", { fg = c.border })
	hl("IblScope", { fg = c.border_focus })
	hl("IblWhitespace", { fg = c.border })
	hl("IndentBlanklineChar", { fg = c.border })
	hl("IndentBlanklineContextChar", { fg = c.border_focus })
	hl("IndentBlanklineSpaceChar", { fg = c.border })

	-- Trouble.nvim
	hl("TroubleNormal", { fg = c.fg, bg = c.bg_alt })
	hl("TroubleNormalNC", { fg = c.fg, bg = c.bg_alt })
	hl("TroubleText", { fg = c.fg })
	hl("TroubleCount", { fg = c.magenta, bold = true })
	hl("TroubleError", { fg = c.red })
	hl("TroubleWarning", { fg = c.yellow })
	hl("TroubleInformation", { fg = c.cyan })
	hl("TroubleHint", { fg = c.fg_dim })
	hl("TroubleLocation", { fg = c.fg_muted })
	hl("TroubleFile", { fg = c.cyan })
	hl("TroubleFoldIcon", { fg = c.fg_muted })
	hl("TroubleIndent", { fg = c.border })
	hl("TroubleSource", { fg = c.fg_muted })
	hl("TroubleCode", { fg = c.fg_muted })

	-- Lazy.nvim
	hl("LazyH1", { fg = c.cyan, bold = true })
	hl("LazyH2", { fg = c.fg, bold = true })
	hl("LazyButton", { fg = c.fg, bg = c.bg_hi })
	hl("LazyButtonActive", { fg = c.bg, bg = c.cyan })
	hl("LazySpecial", { fg = c.cyan })
	hl("LazyProgressDone", { fg = c.green })
	hl("LazyProgressTodo", { fg = c.fg_muted })
	hl("LazyReasonPlugin", { fg = c.property })
	hl("LazyReasonEvent", { fg = c.yellow })
	hl("LazyReasonKeys", { fg = c.magenta })
	hl("LazyReasonCmd", { fg = c.cyan })
	hl("LazyReasonFt", { fg = c.type })
	hl("LazyReasonStart", { fg = c.green })

	-- Which-key
	hl("WhichKey", { fg = c.cyan })
	hl("WhichKeyGroup", { fg = c.property })
	hl("WhichKeyDesc", { fg = c.fg })
	hl("WhichKeySeparator", { fg = c.fg_muted })
	hl("WhichKeyFloat", { bg = c.bg_alt })
	hl("WhichKeyBorder", { fg = c.border, bg = c.bg_alt })
	hl("WhichKeyValue", { fg = c.fg_dim })

	-- nvim-notify
	hl("NotifyERRORBorder", { fg = c.red_dark })
	hl("NotifyWARNBorder", { fg = c.orange })
	hl("NotifyINFOBorder", { fg = c.cyan })
	hl("NotifyDEBUGBorder", { fg = c.fg_muted })
	hl("NotifyTRACEBorder", { fg = c.magenta })
	hl("NotifyERRORTitle", { fg = c.red })
	hl("NotifyWARNTitle", { fg = c.yellow })
	hl("NotifyINFOTitle", { fg = c.cyan })
	hl("NotifyDEBUGTitle", { fg = c.fg_dim })
	hl("NotifyTRACETitle", { fg = c.magenta })
	hl("NotifyERRORIcon", { fg = c.red })
	hl("NotifyWARNIcon", { fg = c.yellow })
	hl("NotifyINFOIcon", { fg = c.cyan })
	hl("NotifyDEBUGIcon", { fg = c.fg_dim })
	hl("NotifyTRACEIcon", { fg = c.magenta })
	hl("NotifyERRORBody", { fg = c.fg })
	hl("NotifyWARNBody", { fg = c.fg })
	hl("NotifyINFOBody", { fg = c.fg })
	hl("NotifyDEBUGBody", { fg = c.fg })
	hl("NotifyTRACEBody", { fg = c.fg })

	-- Mason
	hl("MasonNormal", { fg = c.fg, bg = c.bg_alt })
	hl("MasonHeader", { fg = c.bg, bg = c.cyan, bold = true })
	hl("MasonHeaderSecondary", { fg = c.bg, bg = c.yellow, bold = true })
	hl("MasonHighlight", { fg = c.cyan })
	hl("MasonHighlightBlock", { fg = c.bg, bg = c.cyan })
	hl("MasonHighlightBlockBold", { fg = c.bg, bg = c.cyan, bold = true })
	hl("MasonMuted", { fg = c.fg_muted })
	hl("MasonMutedBlock", { fg = c.bg, bg = c.fg_muted })

	-- flash.nvim
	hl("FlashLabel", { fg = c.bg, bg = c.magenta, bold = true })
	hl("FlashMatch", { fg = c.cyan })
	hl("FlashCurrent", { fg = c.yellow })
	hl("FlashBackdrop", { fg = c.fg_muted })

	-- mini.nvim
	hl("MiniIndentscopeSymbol", { fg = c.border_focus })
	hl("MiniJump", { fg = c.bg, bg = c.magenta })
	hl("MiniJump2dSpot", { fg = c.magenta, bold = true })
	hl("MiniStatuslineDevinfo", { fg = c.fg_dim, bg = c.bg_hi })
	hl("MiniStatuslineFileinfo", { fg = c.fg_dim, bg = c.bg_hi })
	hl("MiniStatuslineFilename", { fg = c.fg, bg = c.bg_alt })
	hl("MiniStatuslineInactive", { fg = c.fg_muted, bg = c.bg_alt })
	hl("MiniStatuslineModeCommand", { fg = c.bg, bg = c.yellow, bold = true })
	hl("MiniStatuslineModeInsert", { fg = c.bg, bg = c.green, bold = true })
	hl("MiniStatuslineModeNormal", { fg = c.bg, bg = c.cyan, bold = true })
	hl("MiniStatuslineModeOther", { fg = c.bg, bg = c.magenta, bold = true })
	hl("MiniStatuslineModeReplace", { fg = c.bg, bg = c.red, bold = true })
	hl("MiniStatuslineModeVisual", { fg = c.bg, bg = c.magenta, bold = true })
	hl("MiniCursorword", { bg = c.word_highlight })
	hl("MiniCursorwordCurrent", { bg = c.word_highlight })

	-- Alpha / Dashboard
	hl("AlphaHeader", { fg = c.cyan })
	hl("AlphaButtons", { fg = c.fg })
	hl("AlphaShortcut", { fg = c.yellow })
	hl("AlphaFooter", { fg = c.fg_muted, italic = true })
	hl("DashboardHeader", { fg = c.cyan })
	hl("DashboardCenter", { fg = c.fg })
	hl("DashboardShortcut", { fg = c.yellow })
	hl("DashboardFooter", { fg = c.fg_muted, italic = true })

	-- Illuminate
	hl("IlluminatedWordText", { bg = c.word_highlight })
	hl("IlluminatedWordRead", { bg = c.word_highlight })
	hl("IlluminatedWordWrite", { bg = c.word_highlight_strong })

	-- nvim-navic (breadcrumbs)
	hl("NavicIconsFile", { fg = c.fg })
	hl("NavicIconsModule", { fg = c.fg_dim })
	hl("NavicIconsNamespace", { fg = c.fg_dim })
	hl("NavicIconsPackage", { fg = c.fg_dim })
	hl("NavicIconsClass", { fg = c.type })
	hl("NavicIconsMethod", { fg = c.func_call })
	hl("NavicIconsProperty", { fg = c.property })
	hl("NavicIconsField", { fg = c.property })
	hl("NavicIconsConstructor", { fg = c.type })
	hl("NavicIconsEnum", { fg = c.type })
	hl("NavicIconsInterface", { fg = c.type })
	hl("NavicIconsFunction", { fg = c.func_call })
	hl("NavicIconsVariable", { fg = c.fg })
	hl("NavicIconsConstant", { fg = c.constant })
	hl("NavicIconsString", { fg = c.string })
	hl("NavicIconsNumber", { fg = c.number })
	hl("NavicIconsBoolean", { fg = c.keyword })
	hl("NavicIconsArray", { fg = c.fg })
	hl("NavicIconsObject", { fg = c.fg })
	hl("NavicIconsKey", { fg = c.property })
	hl("NavicIconsNull", { fg = c.keyword })
	hl("NavicIconsEnumMember", { fg = c.constant })
	hl("NavicIconsStruct", { fg = c.type })
	hl("NavicIconsEvent", { fg = c.property })
	hl("NavicIconsOperator", { fg = c.fg })
	hl("NavicIconsTypeParameter", { fg = c.type })
	hl("NavicText", { fg = c.fg_dim })
	hl("NavicSeparator", { fg = c.fg_muted })

	-- Noice
	hl("NoiceCmdline", { fg = c.fg })
	hl("NoiceCmdlineIcon", { fg = c.cyan })
	hl("NoiceCmdlineIconSearch", { fg = c.yellow })
	hl("NoiceCmdlinePopup", { fg = c.fg, bg = c.bg_alt })
	hl("NoiceCmdlinePopupBorder", { fg = c.border, bg = c.bg_alt })
	hl("NoiceConfirm", { fg = c.fg, bg = c.bg_alt })
	hl("NoiceConfirmBorder", { fg = c.border, bg = c.bg_alt })
	hl("NoicePopup", { fg = c.fg, bg = c.bg_alt })
	hl("NoicePopupBorder", { fg = c.border, bg = c.bg_alt })

	-- Leap.nvim
	hl("LeapMatch", { fg = c.cyan, bold = true })
	hl("LeapLabelPrimary", { fg = c.bg, bg = c.magenta, bold = true })
	hl("LeapLabelSecondary", { fg = c.bg, bg = c.cyan, bold = true })
	hl("LeapBackdrop", { fg = c.fg_muted })

	-- Hop.nvim
	hl("HopNextKey", { fg = c.magenta, bold = true })
	hl("HopNextKey1", { fg = c.cyan, bold = true })
	hl("HopNextKey2", { fg = c.blue })
	hl("HopUnmatched", { fg = c.fg_muted })

	-- Aerial
	hl("AerialLine", { bg = c.selection })
	hl("AerialGuide", { fg = c.border })
	hl("AerialClass", { fg = c.type })
	hl("AerialFunction", { fg = c.func_call })
	hl("AerialMethod", { fg = c.func_call })

	-- Bufferline
	hl("BufferLineFill", { bg = c.bg })
	hl("BufferLineBackground", { fg = c.fg_muted, bg = c.bg })
	hl("BufferLineBuffer", { fg = c.fg_muted, bg = c.bg })
	hl("BufferLineBufferVisible", { fg = c.fg_dim, bg = c.bg })
	hl("BufferLineBufferSelected", { fg = c.fg, bg = c.bg, bold = true })
	hl("BufferLineTab", { fg = c.fg_muted, bg = c.bg })
	hl("BufferLineTabSelected", { fg = c.fg, bg = c.bg })
	hl("BufferLineTabSeparator", { fg = c.bg, bg = c.bg })
	hl("BufferLineTabSeparatorSelected", { fg = c.bg, bg = c.bg })
	hl("BufferLineSeparator", { fg = c.bg, bg = c.bg })
	hl("BufferLineSeparatorVisible", { fg = c.bg, bg = c.bg })
	hl("BufferLineSeparatorSelected", { fg = c.bg, bg = c.bg })
	hl("BufferLineCloseButton", { fg = c.fg_muted, bg = c.bg })
	hl("BufferLineCloseButtonVisible", { fg = c.fg_dim, bg = c.bg })
	hl("BufferLineCloseButtonSelected", { fg = c.fg, bg = c.bg })
	hl("BufferLineModified", { fg = c.green, bg = c.bg })
	hl("BufferLineModifiedVisible", { fg = c.green, bg = c.bg })
	hl("BufferLineModifiedSelected", { fg = c.green, bg = c.bg })
	hl("BufferLineIndicatorSelected", { fg = c.cyan, bg = c.bg })
	hl("BufferLineIndicatorVisible", { fg = c.bg, bg = c.bg })
	hl("BufferLineDuplicate", { fg = c.fg_muted, bg = c.bg, italic = true })
	hl("BufferLineDuplicateVisible", { fg = c.fg_dim, bg = c.bg, italic = true })
	hl("BufferLineDuplicateSelected", { fg = c.fg, bg = c.bg, italic = true })

	-- ============================================
	-- Markdown / Markup
	-- ============================================

	-- Traditional Vim markdown syntax groups
	hl("markdownH1", { fg = c.red, bold = true })
	hl("markdownH2", { fg = c.yellow, bold = true })
	hl("markdownH3", { fg = c.green_bright, bold = true })
	hl("markdownH4", { fg = c.cyan, bold = true })
	hl("markdownH5", { fg = c.blue, bold = true })
	hl("markdownH6", { fg = c.magenta, bold = true })
	hl("markdownH1Delimiter", { fg = c.red })
	hl("markdownH2Delimiter", { fg = c.yellow })
	hl("markdownH3Delimiter", { fg = c.green_bright })
	hl("markdownH4Delimiter", { fg = c.cyan })
	hl("markdownH5Delimiter", { fg = c.blue })
	hl("markdownH6Delimiter", { fg = c.magenta })
	hl("markdownHeadingDelimiter", { fg = c.yellow })
	hl("markdownHeadingRule", { fg = c.fg_muted })

	hl("markdownBold", { fg = c.fg, bold = true })
	hl("markdownItalic", { fg = c.fg, italic = true })
	hl("markdownBoldItalic", { fg = c.fg, bold = true, italic = true })
	hl("markdownStrike", { fg = c.fg_muted, strikethrough = true })

	hl("markdownCode", { fg = c.green_bright })
	hl("markdownCodeBlock", { fg = c.green_bright })
	hl("markdownCodeDelimiter", { fg = c.fg_muted })
	hl("markdownBlockquote", { fg = c.fg_dim, italic = true })

	hl("markdownLink", { fg = c.link })
	hl("markdownLinkText", { fg = c.link })
	hl("markdownUrl", { fg = c.link, underline = true })
	hl("markdownUrlTitle", { fg = c.string })
	hl("markdownLinkDelimiter", { fg = c.fg_muted })
	hl("markdownLinkTextDelimiter", { fg = c.fg_muted })

	hl("markdownListMarker", { fg = c.keyword })
	hl("markdownOrderedListMarker", { fg = c.keyword })

	hl("markdownRule", { fg = c.fg_muted })
	hl("markdownFootnote", { fg = c.property })
	hl("markdownFootnoteDefinition", { fg = c.property })

	hl("markdownEscape", { fg = c.constant })
	hl("markdownError", { fg = c.red })

	-- render-markdown.nvim
	hl("RenderMarkdownH1", { fg = c.red, bold = true })
	hl("RenderMarkdownH2", { fg = c.yellow, bold = true })
	hl("RenderMarkdownH3", { fg = c.green_bright, bold = true })
	hl("RenderMarkdownH4", { fg = c.cyan, bold = true })
	hl("RenderMarkdownH5", { fg = c.blue, bold = true })
	hl("RenderMarkdownH6", { fg = c.magenta, bold = true })
	hl("RenderMarkdownH1Bg", { bg = palette.util.blend("#FC6B8320", c.bg) })
	hl("RenderMarkdownH2Bg", { bg = palette.util.blend("#F1B46720", c.bg) })
	hl("RenderMarkdownH3Bg", { bg = palette.util.blend("#70B48920", c.bg) })
	hl("RenderMarkdownH4Bg", { bg = palette.util.blend("#88C0D020", c.bg) })
	hl("RenderMarkdownH5Bg", { bg = palette.util.blend("#81A1C120", c.bg) })
	hl("RenderMarkdownH6Bg", { bg = palette.util.blend("#B48EAD20", c.bg) })
	hl("RenderMarkdownCode", { bg = c.bg_alt })
	hl("RenderMarkdownCodeInline", { fg = c.green_bright })
	hl("RenderMarkdownBullet", { fg = c.keyword })
	hl("RenderMarkdownQuote", { fg = c.fg_dim, italic = true })
	hl("RenderMarkdownDash", { fg = c.fg_muted })
	hl("RenderMarkdownLink", { fg = c.link })
	hl("RenderMarkdownChecked", { fg = c.green_bright })
	hl("RenderMarkdownUnchecked", { fg = c.fg_muted })

	set_terminal_colors(palette.terminal)
end

return M
