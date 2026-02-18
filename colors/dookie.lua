-- Name:         dookie
-- Description:  A color scheme inspired by Plan9's acme editor, but with a personal touch.
-- Author:       Jose Esparza <joseesparzadc@gmail.com>
-- License:      MIT
-- Last Updated: 2025 Nov 14

vim.cmd.highlight('clear')
vim.g.colors_name = 'dookie'

---@class DookieColors
local colors = {
    foreground = '#000000',
    almost_foreground = '#b7b19c',
    background = '#ffffea',
    dim_background = '#ffffca',
    darker_background = '#eeee9e',
    cursor = "#98ce8f",
    error = '#b85c57',
    warning = '#8f7634',
    info = '#57864e',
    hint = '#2a8dc5',
    statusline = '#aeeeee',
    statusline_inactive = '#eaffff',
}

---Set highlight group with proper defaults
---@param name string
---@param attrs vim.api.keyset.highlight
local function hi(name, attrs)

    local final_attrs = {}
    for k, v in pairs(attrs) do
        final_attrs[k] = v
    end

    final_attrs.force = true

    if not final_attrs.cterm then
        final_attrs.cterm = {}
        if attrs.bold then
            final_attrs.cterm.bold = true
        end
        if attrs.italic then
            final_attrs.cterm.italic = true
        end
        if attrs.underline then
            final_attrs.cterm.underline = true
        end
        if attrs.undercurl then
            final_attrs.cterm.undercurl = true
        end
    end

    vim.api.nvim_set_hl(0, name, final_attrs)
end

---Create highlight link
---@param from string
---@param to string
local function link(from, to)
    vim.api.nvim_set_hl(0, from, { link = to, force = true })
end


local groups = {
    -- Core
    Normal = { fg = colors.foreground, bg = colors.background },
    NormalFloat = { fg = colors.foreground, bg = colors.background },
    FloatBorder = { fg = colors.foreground, bg = colors.background },

    -- Cursor and lines
    Cursor = { bg = colors.cursor },
    CursorLine = { bg = colors.dim_background },
    CursorLineNr = { fg = colors.foreground, bg = colors.dim_background },
    CursorColumn = { bg = colors.dim_background },

    -- Line numbers
    LineNr = { fg = colors.foreground, bg = colors.dim_background },
    SignColumn = { bg = colors.dim_background },

    -- Selection and matching
    Visual = { bg = colors.darker_background },
    MatchParen = { fg = colors.foreground, bg = colors.darker_background, underline = true },

    -- Search
    Search = { fg = colors.foreground, bg = colors.dim_background, bold = true },
    IncSearch = { fg = colors.foreground, bg = colors.darker_background, bold = true },

    -- Special text
    NonText = { fg = colors.foreground },
    Title = { fg = colors.foreground, bold = true },
    Directory = { fg = colors.foreground, bold = true },
    Folded = { fg = colors.foreground, bg = colors.dim_background },
    ColorColumn = { bg = colors.error },

    -- Menu
    Pmenu = { fg = colors.foreground, bg = colors.dim_background },
    PmenuSel = { fg = colors.foreground, bg = colors.dim_background, bold = true },
    PmenuSbar = { bg = colors.dim_background },
    PmenuThumb = { bg = colors.foreground },

    TabLine = { fg = colors.foreground, bg = colors.dim_background },
    TabLineSel = { fg = colors.foreground, bg = colors.background, bold = true },
    TabLineFill = { fg = colors.foreground, bg = colors.dim_background },

    -- State
    StatusLine = { fg = colors.foreground, bg = colors.statusline, bold = true },
    StatusLineNC = { fg = colors.foreground, bg = colors.statusline_inactive },

    -- Window bar
    WinBar = { fg = colors.foreground, bg = colors.background },
    WinBarNC = { fg = colors.foreground, bg = colors.dim_background },

    -- Messages
    ModeMsg = { fg = colors.foreground, bold = true },
    MoreMsg = { fg = colors.foreground, bold = true },
    ErrorMsg = { fg = colors.error, bold = true },
    WarningMsg = { fg = colors.warning, bold = true },
    InfoMsg = { fg = colors.info, bold = true },
    Question = { fg = colors.foreground, bold = true },

    -- Basic syntax (Vim)
    Comment = { fg = colors.foreground, bold = true },
    String = { fg = colors.foreground, bold = true },
    Constant = { fg = colors.foreground },
    Identifier = { fg = colors.foreground },
    Function = { fg = colors.foreground },
    Statement = { fg = colors.foreground },
    Keyword = { fg = colors.foreground },
    PreProc = { fg = colors.foreground },
    Type = { fg = colors.foreground },
    Special = { fg = colors.foreground },
    Delimiter = { fg = colors.foreground },
    Operator = { fg = colors.foreground },
    Error = { fg = colors.error },
    Todo = { fg = colors.foreground, bold = true },

    -- Diagnostics
    DiagnosticError = { fg = colors.error },
    DiagnosticWarn = { fg = colors.warning },
    DiagnosticInfo = { fg = colors.info },
    DiagnosticHint = { fg = colors.hint },

    -- Spell checking
    SpellBad = { undercurl = true, sp = colors.error },
    SpellCap = { undercurl = true, sp = colors.info },
    SpellRare = { undercurl = true, sp = colors.hint },
    SpellLocal = { undercurl = true, sp = colors.warning },

    -- Git
    GitGutterAdd = { fg = colors.info },
    GitGutterChange = { fg = colors.warning },
    GitGutterDelete = { fg = colors.error },
    GitSignsAdd = { fg = colors.info },
    GitSignsChange = { fg = colors.warning },
    GitSignsDelete = { fg = colors.error },
    GitSignsCurrentLineBlame = {
        fg = colors.almost_foreground,
        bg = colors.background,
        italic = true
    },

    -- Diff
    DiffAdd = { fg = colors.info, bg = colors.dim_background },
    DiffChange = { fg = colors.warning, bg = colors.dim_background },
    DiffDelete = { fg = colors.error, bg = colors.dim_background },
    DiffText = { fg = colors.foreground, bg = colors.dim_background },

    -- Copilot
    CopilotSuggestion = { fg = colors.almost_foreground },
    CopilotSuggestionSelected = { fg = colors.foreground },
}

local treesitter_groups = {
    -- Comments
    ['@comment'] = { link = 'Comment' },

    -- Strings
    ['@string'] = { link = 'String' },
    ['@string.documentation'] = { link = 'String' },
    ['@string.escape'] = { fg = colors.foreground, bold = true },
    ['@string.special'] = { link = 'String' },

    -- Constants and variables
    ['@constant'] = { link = 'Constant' },
    ['@constant.builtin'] = { link = 'Constant' },
    ['@variable'] = { link = 'Identifier' },
    ['@variable.builtin'] = { fg = colors.foreground, bold = true },

    -- Functions
    ['@function'] = { link = 'Function' },
    ['@function.builtin'] = { link = 'Function' },
    ['@function.method'] = { link = 'Function' },
    ['@function.call'] = { link = 'Function' },

    -- Keywords
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.function'] = { link = 'Keyword' },
    ['@keyword.return'] = { link = 'Keyword' },
    ['@keyword.operator'] = { link = 'Operator' },

    -- Types
    ['@type'] = { link = 'Type' },
    ['@type.builtin'] = { link = 'Type' },
    ['@type.definition'] = { link = 'Type' },

    -- Operators and punctuation
    ['@operator'] = { link = 'Operator' },
    ['@punctuation'] = { link = 'Delimiter' },
    ['@punctuation.bracket'] = { link = 'Delimiter' },
    ['@punctuation.delimiter'] = { link = 'Delimiter' },
    ['@punctuation.special'] = { link = 'Delimiter' },

    -- Miscellaneous
    ['@tag'] = { fg = colors.foreground, bold = true },
    ['@tag.delimiter'] = { link = 'Delimiter' },
    ['@property'] = { fg = colors.foreground },
    ['@field'] = { link = 'Identifier' },
    ['@parameter'] = { fg = colors.foreground },
    ['@namespace'] = { fg = colors.foreground },

    -- Brands
    ['@markup.heading'] = { fg = colors.foreground, bold = true },
    ['@markup.italic'] = { italic = true },
    ['@markup.bold'] = { bold = true },
    ['@markup.link'] = { fg = colors.info, underline = true },
}


for group, attrs in pairs(groups) do
    hi(group, attrs)
end

for group, attrs in pairs(treesitter_groups) do
    if attrs.link then
        link(group, attrs.link)
    else
        hi(group, attrs)
    end
end

link('CurSearch', 'IncSearch')
link('KeyWord', 'Keyword')

if vim.g.dookie_debug then
    vim.notify(string.format(
        'Dookie theme loaded with %d highlight groups',
        #vim.tbl_keys(groups) + #vim.tbl_keys(treesitter_groups)
    ), vim.log.levels.INFO)
end
