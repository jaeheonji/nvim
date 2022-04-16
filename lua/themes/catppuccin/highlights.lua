local cp = require("themes.catppuccin").color_palette()
local tp = require("themes.utils").tp

return {
    -- Basic
    StatusLine = { bg = tp(cp.black1) },
    StatusLineNC = { bg = tp(cp.black1) },

    -- NeoTree
    -- NeoTreeIndentMarker = { bg = "" },

    -- Custom
    -- ExplorerTitle = {},
}
