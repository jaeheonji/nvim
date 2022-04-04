local transparentify = require("core.utils").transparentify
local highlight = require("core.utils").highlight

local M = {}

M.palette = {
    fg = "#F8F8F2",

    bglighter = "#424450",
    bglight = "#343746",
    bg = "#282A36",
    bgdark = "#21222C",
    bgdarker = "#191A21",

    comment = "#6272A4",
    selection = "#44475A",
    subtle = "#424450",

    cyan = "#8BE9FD",
    green = "#50FA7B",
    orange = "#FFB86C",
    pink = "#FF79C6",
    purple = "#BD93F9",
    red = "#FF5555",
    yellow = "#F1FA8C",
}

M.init = function()
    highlight("Normal", { bg = transparentify(M.palette.bg) })

    highlight("EndOfBuffer", { fg = M.palette.bg })
    highlight("CursorLineNr", { fg = M.palette.purple })

    highlight("StatusLine", { fg = M.palette.bgdarker, bg = transparentify(M.palette.bgdarker) })
    highlight("StatusLineNC", { fg = M.palette.bgdarker, bg = transparentify(M.palette.bgdarker) })

    highlight("VertSplit", { fg = M.palette.purple, bg = M.palette.bg, style = "NONE" })

    highlight("FloatBorder", { fg = M.palette.purple, bg = M.palette.bgdark })
    highlight("NormalFloat", { bg = M.palette.bgdark })

    -- Custom highlight
    highlight("CustomDirectory", { fg = M.palette.pink, bg = M.palette.bgdarker, style = "bold,italic" })
end

M.neo_tree = function()
    highlight("NeoTreeNormal", { bg = M.palette.bgdarker })
    highlight("NeoTreeNormalNC", { bg = M.palette.bgdarker })
    highlight("NeoTreeVertSplit", { fg = M.palette.bgdarker, bg = M.palette.bgdarker })

    highlight("NeoTreeIndentMarker", { fg = M.palette.purple })
end

M.fidget = function()
    highlight("FidgetTitle", { fg = M.palette.purple, style = "bold" })
    highlight("FidgetTask", { fg = M.palette.fg })
end

M.which_key = function()
    highlight("WhichKeyFloat", { bg = M.palette.bgdark })
end

M.telescope = function()
    highlight("TelescopeNormal", { bg = M.palette.bgdark })
    highlight("TelescopeBorder", { fg = M.palette.purple, bg = M.palette.bgdark })
end

M.hlslens = function()
    highlight("Search", { fg = "NONE", bg = M.palette.selection })
    highlight("IncSearch", { fg = M.palette.red, bg = "NONE", style = "bold,underline" })

    highlight("HlSearchLens", { fg = M.palette.purple, bg = "NONE", style = "bold" })
    highlight("HlSearchLensNear", { fg = M.palette.red, bg = "NONE", style = "bold,underline" })
end

return M
