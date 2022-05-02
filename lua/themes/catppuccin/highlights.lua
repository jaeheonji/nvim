local cp = require("catppuccin.api.colors").get_colors()
local tp = require("themes.utils").tp

return {
    -- Basic
    WinSeparator = { fg = cp.blue, bg = tp(cp.black2) },

    StatusLine = { bg = tp(cp.black1) },
    StatusLineNC = { bg = tp(cp.black1) },

    -- NeoTree
    NeoTreeNormal = { bg = tp(cp.black1) },
    NeoTreeNormalNC = { bg = tp(cp.black1) },
    NeoTreeSignColumn = { bg = tp(cp.black1) },
    NeoTreeIndentMarker = { fg = cp.green },

    -- Telescope
    TelescopeNormal = { bg = cp.black1 },
    TelescopeBorder = { fg = cp.blue, bg = cp.black1 },

    -- BufferLine
    BufferLineFill = { bg = tp(cp.black1) },
    BufferLineIndicatorSelected = { fg = cp.blue },
    BufferLineTabClose = { fg = cp.red, bg = tp(cp.black0) },

    -- Custom
    CustomExplorerTitle = { fg = cp.blue, bg = tp(cp.black1), style = "bold,italic" },
    WindowPickerLine = { bg = cp.black1 },
}
