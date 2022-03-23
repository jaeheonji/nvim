local transparent = require("core.utils").config().transparent
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

function M.init()
    if transparent then
        highlight("Normal", { bg = "NONE" })
    end

    highlight("EndOfBuffer", { fg = M.palette.bg })
    highlight("CursorLineNr", { fg = M.palette.purple })

    highlight("StatusLine", { fg = M.palette.bgdarker, bg = M.palette.bgdarker })
    highlight("StatusLineNC", { fg = M.palette.bgdarker, bg = M.palette.bgdarker })

    highlight("VertSplit", { fg = M.palette.bg, bg = M.palette.purple })

    highlight("FloatBorder", { fg = M.palette.purple, bg = M.palette.bgdarker })
    highlight("NormalFloat", { bg = M.palette.bgdarker })
end

function M.nvim_tree()
    highlight("NvimTreeNormal", { bg = M.palette.bgdarker })
    highlight("NvimTreeNormalNC", { bg = M.palette.bgdarker })
    highlight("NvimTreeEndOfBuffer", { fg = M.palette.bgdarker })

    highlight("NvimTreeVertSplit", { fg = M.palette.bgdarker, bg = M.palette.bgdarker })
    highlight("NvimTreeRootFolder", { fg = M.palette.pink, style = "underline" })

    highlight("NvimTreeStatusline", { fg = M.palette.bgdarker, bg = M.palette.bgdarker })
    highlight("NvimTreeStatuslineNC", { fg = M.palette.bgdarker, bg = M.palette.bgdarker })
end

function M.fidget()
    highlight("FidgetTitle", { fg = M.palette.purple, style = "bold" })
    highlight("FidgetTask", { fg = M.palette.fg })
end

function M.which_key()
    highlight("WhichKeyFloat", { bg = M.palette.bgdark })
end

return M
