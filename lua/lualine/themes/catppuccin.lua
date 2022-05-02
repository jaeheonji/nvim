local cp = require("catppuccin.api.colors").get_colors()
local tp = require("themes.utils").tp

return {
    normal = {
        a = { bg = cp.blue, fg = cp.black1, gui = "bold" },
        b = { bg = tp(cp.black4), fg = cp.blue },
        c = { bg = tp(cp.black1), fg = cp.white },
    },
    insert = {
        a = { bg = cp.green, fg = cp.black2, gui = "bold" },
        b = { bg = tp(cp.black4), fg = cp.teal },
    },
    command = {
        a = { bg = cp.peach, fg = cp.black2, gui = "bold" },
        b = { bg = tp(cp.black4), fg = cp.peach },
    },
    visual = {
        a = { bg = cp.mauve, fg = cp.black2, gui = "bold" },
        b = { bg = tp(cp.black4), fg = cp.mauve },
    },
    replace = {
        a = { bg = cp.red, fg = cp.black2, gui = "bold" },
        b = { bg = tp(cp.black4), fg = cp.red },
    },
    inactive = {
        a = { bg = cp.blue, fg = cp.black1 },
        b = { bg = tp(cp.black1), fg = cp.black4, gui = "bold" },
        c = { bg = tp(cp.black1), fg = cp.gray0 },
    },
}
