local cp = require("catppuccin.palettes").get_palette()
local tp = require("themes.utils").tp

return {
    -- Basic
    WinSeparator = { fg = cp.blue, bg = tp(cp.crust) },

    StatusLine = { fg = cp.text, bg = tp(cp.mantle) },
    StatusLineNC = { fg = cp.surface1, bg = tp(cp.mantle) },

    -- NeoTree
    NeoTreeNormal = { bg = tp(cp.mantle) },
    NeoTreeNormalNC = { bg = tp(cp.mantle) },
    NeoTreeSignColumn = { bg = tp(cp.mantle) },
    NeoTreeIndentMarker = { fg = cp.green },

    -- Telescope
    TelescopeNormal = { bg = cp.mantle },
    TelescopeBorder = { fg = cp.blue, bg = cp.mantle },

    -- BufferLine
    BufferLineFill = { bg = tp(cp.mantle) },
    BufferLineIndicatorSelected = { fg = cp.blue },
    BufferLineTabClose = { fg = cp.red, bg = tp(cp.base) },

    -- Custom
    CustomExplorerTitle = { fg = cp.blue, bg = tp(cp.mantle), style = "bold,italic" },
    WindowPickerLine = { bg = cp.mantle },
}
