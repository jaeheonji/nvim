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

M.lualine_theme = {
    normal = {
        a = { fg = M.palette.fg, bg = M.palette.purple, gui = "bold" },
        b = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
        c = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
    },
    insert = {
        a = { fg = M.palette.fg, bg = M.palette.green, gui = "bold" },
        b = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
        c = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
    },
    visual = {
        a = { fg = M.palette.fg, bg = M.palette.yellow, gui = "bold" },
        b = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
        c = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
    },
    replace = {
        a = { fg = M.palette.fg, bg = M.palette.orange, gui = "bold" },
        b = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
        c = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
    },
    command = {
        a = { fg = M.palette.fg, bg = M.palette.pink, gui = "bold" },
        b = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
        c = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
    },
    inactive = {
        a = { fg = M.palette.fg, bg = M.palette.purple, gui = "bold" },
        b = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
        c = { fg = M.palette.fg, bg = transparentify(M.palette.bgdarker) },
    },
}

function M.init()
    highlight("Normal", { bg = transparentify(M.palette.bg) })

    highlight("EndOfBuffer", { fg = M.palette.bg })
    highlight("CursorLineNr", { fg = M.palette.purple })

    highlight("StatusLine", { fg = M.palette.bgdarker, bg = transparentify(M.palette.bgdarker) })
    highlight("StatusLineNC", { fg = M.palette.bgdarker, bg = transparentify(M.palette.bgdarker) })

    highlight("VertSplit", { fg = M.palette.bg, bg = M.palette.purple })

    highlight("FloatBorder", { fg = M.palette.purple, bg = M.palette.bgdark })
    highlight("NormalFloat", { bg = M.palette.bgdark })
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

function M.telescope()
    highlight("TelescopeNormal", { bg = M.palette.bgdark })
    highlight("TelescopeBorder", { fg = M.palette.purple, bg = M.palette.bgdark })
end

function M.hlslens()
    highlight("Search", { fg = "NONE", bg = M.palette.selection })
    highlight("IncSearch", { fg = M.palette.red, bg = "NONE", style = "bold,underline" })

    highlight("HlSearchLens", { fg = M.palette.purple, bg = "NONE", style = "bold" })
    highlight("HlSearchLensNear", { fg = M.palette.red, bg = "NONE", style = "bold,underline" })
end

return M
