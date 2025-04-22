-- lunaria_glow.lua
-- Neovim colour‑scheme ‑ Lunaria Glow (dark, a11y)
-- Supports optional transparent background via `vim.g.lunaria_glow_transparent = true`
-- Author: <crazywolf132>

local transparent = vim.g.lunaria_glow_transparent == true or vim.g.lunaria_glow_transparent == 1

local c = {
  bg        = "#111111",
  fg        = "#eeeee1",
  comment   = "#999999",
  keyword   = "#6d89ff",
  number    = "#ffb84a",
  string    = "#b3d77e",
  attr      = "#a36c8c",
  punct     = "#cccccc",
  add       = "#76c490",
  del       = "#de7176",

  sidebarBg = "#111111",              -- matches editor bg when opaque
  sidebarFg = "#c2c2b7",              -- 80 % opaque #eeeee1 over bg
}

-- If transparent, drop background assignments where readability depends on user terminal
if transparent then
  c.bg        = "NONE"
  c.sidebarBg = "NONE"
end

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Core UI ------------------------------------------------------------
hi("Normal",          { fg = c.fg, bg = c.bg })
hi("NormalNC",        { fg = c.fg, bg = c.bg })
hi("NormalFloat",     { fg = c.fg, bg = c.bg })
hi("LineNr",          { fg = "#555555", bg = c.bg })
hi("CursorLineNr",    { fg = c.fg, bg = c.bg, bold = true })
hi("CursorLine",      { bg = transparent and "#1a1a1a" or "#1a1a1a" })
hi("SignColumn",      { fg = c.sidebarFg, bg = c.sidebarBg })
hi("VertSplit",       { fg = "#1b1b1b",  bg = c.bg })
hi("Visual",          { bg = "#333333" })
hi("Pmenu",           { fg = c.fg, bg = transparent and "#181818" or "#181818" })
hi("PmenuSel",        { fg = c.fg, bg = "#333333" })
hi("PmenuThumb",      { fg = c.fg, bg = "#444444" })
hi("StatusLine",      { fg = c.sidebarFg, bg = c.sidebarBg })
hi("StatusLineNC",    { fg = "#707070",  bg = c.sidebarBg })

-- Syntax / Treesitter ------------------------------------------------
hi("Comment",         { fg = c.comment, italic = true })
hi("Constant",        { fg = c.number })
hi("String",          { fg = c.string })
hi("Character",       { fg = c.string })
hi("Number",          { fg = c.number })
hi("Boolean",         { fg = c.number })
hi("Float",           { fg = c.number })
hi("Identifier",      { fg = c.fg })
hi("Function",        { fg = c.number })
hi("Statement",       { fg = c.keyword })
hi("Keyword",         { fg = c.keyword })
hi("Operator",        { fg = c.keyword })
hi("PreProc",         { fg = c.keyword })
hi("Type",            { fg = c.number })
hi("Special",         { fg = c.attr })
hi("Delimiter",       { fg = c.punct })

-- Tree‑sitter links --------------------------------------------------
hi("@comment",        { link = "Comment" })
hi("@string",         { link = "String" })
hi("@number",         { link = "Number" })
hi("@boolean",        { link = "Boolean" })
hi("@keyword",        { link = "Keyword" })
hi("@function",       { link = "Function" })
hi("@type",           { link = "Type" })
hi("@variable",       { fg = c.fg })
hi("@property",       { fg = c.attr })
hi("@punctuation",    { fg = c.punct })

-- Git / diff ---------------------------------------------------------
hi("DiffAdd",         { fg = c.add, bg = transparent and "NONE" or "#203520" })
hi("DiffDelete",      { fg = c.del, bg = transparent and "NONE" or "#33151b" })
hi("DiffChange",      { fg = c.keyword, bg = transparent and "NONE" or "#12233a" })
hi("DiffText",        { fg = c.keyword, bg = transparent and "NONE" or "#1b3761" })

-- Diagnostics --------------------------------------------------------
hi("DiagnosticError", { fg = c.del })
hi("DiagnosticWarn",  { fg = c.number })
hi("DiagnosticInfo",  { fg = c.keyword })
hi("DiagnosticHint",  { fg = c.string })

-- LSP signs
hi("DiagnosticSignError", { fg = c.del, bg = c.sidebarBg })
hi("DiagnosticSignWarn",  { fg = c.number, bg = c.sidebarBg })
hi("DiagnosticSignInfo",  { fg = c.keyword, bg = c.sidebarBg })
hi("DiagnosticSignHint",  { fg = c.string, bg = c.sidebarBg })

-- Telescope / nvim‑cmp extras ---------------------------------------
hi("TelescopeNormal", { fg = c.fg, bg = c.bg })
hi("TelescopeBorder", { fg = "#444444", bg = c.bg })
hi("CmpItemAbbr",     { fg = c.fg })
hi("CmpItemAbbrMatch",{ fg = c.keyword, bold = true })
hi("CmpItemKind",     { fg = c.number })

-- Fold column & whitespace guides -----------------------------------
hi("FoldColumn",      { fg = "#444444", bg = c.bg })
hi("Whitespace",      { fg = "#2a2a2a" })
hi("IndentBlanklineChar", { fg = "#222222" })

-- End of scheme ------------------------------------------------------
