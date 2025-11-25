-- Name:         dookie
-- Description:  A color scheme inspired by Plan9's acme editor, but with a personal touch.
-- Author:       Jose Esparza <joseesparzadc@gmail.com>
-- License:      MIT
-- Last Updated: 2025 Nov 14

vim.cmd.highlight('clear')
vim.g.colors_name = 'dookie'

local hi = function(name, val)
    -- Force links
    val.force = true

    -- Make sure that `cterm` attribute is not populated from `gui`
    val.cterm = val.cterm or {} ---@type vim.api.keyset.highlight

    -- Define global highlight
    vim.api.nvim_set_hl(0, name, val)
end

-- Colors
local colors = {
    foreground = '#000000',
    almost_foreground = '#b7b19c',
    background = '#ffffea',
    dim_background = '#ffffca',
    cursor = "#98ce8f",
    error = '#b85c57',
    warning = '#8f7634',
    info = '#57864e',
    hint = '#2a8dc5',
    statusline = '#aeeeee',
    statusline_inactive = '#eaffff',
}

-- Editor UI
hi('Normal', { fg = colors.foreground, bg = colors.background })
hi('CursorLine', { bg = colors.dim_background })
hi('CursorLineNr', { fg = colors.foreground, bg = colors.dim_background })
hi('LineNr', { fg = colors.foreground, bg = colors.dim_background })
hi('SignColumn', { bg = colors.dim_background })
hi('Cursor', { bg = colors.cursor })
hi('Visual', { bg = colors.dim_background })
hi('Directory', { fg = colors.foreground, bold = true })
hi('NonText', { fg = colors.foreground, bg = colors.background })
hi('Title', { fg = colors.foreground, bold = true })
hi('Search', { fg = colors.foreground, bg = colors.dim_background, bold = true })
hi('ModeMsg', { fg = colors.foreground, bg = colors.background, bold = true })

-- Completion menu
hi('Pmenu', { fg = colors.foreground, bg = colors.dim_background })
hi('PmenuSel', { fg = colors.foreground, bg = colors.dim_background, bold = true })
hi('PmenuSbar', { bg = colors.dim_background })
hi('PmenuThumb', { bg = colors.foreground })

-- Floating windows
hi('NormalFloat', { fg = colors.foreground, bg = colors.background })
hi('FloatBorder', { fg = colors.foreground, bg = colors.background })

-- Tab line
hi('TabLine', { fg = colors.foreground, bg = colors.dim_background })
hi('TabLineSel', { fg = colors.foreground, bg = colors.background, bold = true })
hi('TabLineFill', { fg = colors.foreground, bg = colors.dim_background })

-- Syntax
hi('Comment', { fg = colors.foreground, bold = true })
hi('String', { fg = colors.foreground, bold = true })
hi('Constant', { fg = colors.foreground })
hi('Identifier', { fg = colors.foreground })
hi('Function', { fg = colors.foreground })
hi('Statement', { fg = colors.foreground })
hi('Keyword', { fg = colors.foreground })
hi('KeyWord', { link = 'Keyword' })
hi('PreProc', { fg = colors.foreground })
hi('Type', { fg = colors.foreground })
hi('Special', { fg = colors.foreground })
hi('Delimiter', { fg = colors.foreground })
hi('Operator', { fg = colors.foreground })
hi('Error', { fg = colors.foreground })
hi('Todo', { fg = colors.foreground })

-- Diagnostics
hi('DiagnosticError', { fg = colors.error })
hi('DiagnosticWarn', { fg = colors.warning })
hi('DiagnosticInfo', { fg = colors.info })
hi('DiagnosticHint', { fg = colors.hint })

-- Treesitter
hi('@comment', { fg = colors.foreground, bold = true })
hi('@string', { fg = colors.foreground, bold = true })
hi('@string.documentation', { fg = colors.foreground, bold = true })
hi('@string.escape', { fg = colors.foreground, bold = true })
hi('@string.special', { fg = colors.foreground, bold = true })
hi('@constant', { fg = colors.foreground })
hi('@variable', { fg = colors.foreground })
hi('@function', { fg = colors.foreground })
hi('@function.builtin', { fg = colors.foreground })
hi('@function.method', { fg = colors.foreground })
hi('@keyword', { link = 'Keyword' })
hi('@keyword.function', { fg = colors.foreground })
hi('@keyword.return', { fg = colors.foreground })
hi('@type', { fg = colors.foreground })
hi('@type.builtin', { fg = colors.foreground })
hi('@operator', { fg = colors.foreground })
hi('@punctuation', { fg = colors.foreground })
hi('@punctuation.bracket', { fg = colors.foreground })
hi('@punctuation.delimiter', { fg = colors.foreground })

-- Git
hi('GitGutterAdd', { fg = colors.info })
hi('GitGutterChange', { fg = colors.warning })
hi('GitGutterDelete', { fg = colors.error })
hi('GitSignsAdd', { fg = colors.info })
hi('GitSignsChange', { fg = colors.warning })
hi('GitSignsDelete', { fg = colors.error })
hi('GitSignsCurrentLineBlame', { fg = colors.foreground, bg = colors.background, italic = true })

-- Winbar
hi('WinBar', { fg = colors.foreground, bg = colors.background })
hi('WinBarNC', { fg = colors.foreground, bg = colors.dim_background })
hi('WinBarSeparator', { fg = colors.foreground, bg = colors.background })

-- Diffview
hi('DiffDelete', { fg = colors.error, bg = colors.dim_background })
hi('DiffAdd', { fg = colors.info, bg = colors.dim_background })
hi('DiffChange', { fg = colors.warning, bg = colors.dim_background })
hi('DiffText', { fg = colors.foreground, bg = colors.dim_background })

-- Statusline
hi('StatusLine', { fg = colors.foreground, bg = colors.statusline, bold = true })
hi('StatusLineNC', { fg = colors.foreground, bg = colors.statusline_inactive })
hi('StatusLineSeparator', { fg = colors.foreground, bg = colors.dim_background })

-- Copilot
hi('CopilotSuggestion', { fg = colors.almost_foreground })
hi('CopilotSuggestionSelected', { fg = colors.almost_foreground })
