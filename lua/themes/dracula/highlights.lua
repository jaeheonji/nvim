local cp = require("themes.dracula").get_colors()
local tp = require("themes.utils").tp

return {
    -- Basic
    Normal = { bg = tp(cp.bg) },
    EndOfBuffer = { fg = cp.bg },
    WinSeparator = { fg = cp.purple, bg = tp(cp.bg) },

    StatusLine = { bg = tp(cp.bgdarker) },
    StatusLineNC = { bg = tp(cp.bgdarker) },

    -- NeoTree
    NeoTreeNormal = { bg = tp(cp.bgdarker) },
    NeoTreeNormalNC = { bg = tp(cp.bgdarker) },
    NeoTreeSignColumn = { bg = tp(cp.bgdarker) },
    NeoTreeIndentMarker = { fg = cp.purple },

    -- Telescope
    TelescopeNormal = { bg = cp.bgdarker },
    TelescopeBorder = { fg = cp.purple, bg = cp.bgdarker },

    -- BufferLine
    BufferLineFill = { bg = tp(cp.bgdarker) },
    BufferLineIndicatorSelected = { fg = cp.purple },
    BufferLineTabClose = { fg = cp.pink, bg = tp(cp.bgdark) },

    -- Custom
    CustomExplorerTitle = { fg = cp.purple, bg = tp(cp.bgdarker), style = "bold,italic" },
    WindowPickerLine = { bg = cp.bgdarker },
}
