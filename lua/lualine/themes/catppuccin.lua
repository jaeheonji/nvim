local cp = require("catppuccin.api.colors").get_colors()
local tp = require("themes.utils").tp

return {
    normal = {
        a = { bg = cp.blue, fg = cp.mantle, gui = "bold" },
        b = { bg = tp(cp.surface1), fg = cp.blue },
        c = { bg = tp(cp.mantle), fg = cp.text },
    },
    insert = {
        a = { bg = cp.green, fg = cp.crust, gui = "bold" },
        b = { bg = tp(cp.surface1), fg = cp.teal },
    },
    command = {
        a = { bg = cp.peach, fg = cp.crust, gui = "bold" },
        b = { bg = tp(cp.surface1), fg = cp.peach },
    },
    visual = {
        a = { bg = cp.mauve, fg = cp.crust, gui = "bold" },
        b = { bg = tp(cp.surface1), fg = cp.mauve },
    },
    replace = {
        a = { bg = cp.red, fg = cp.crust, gui = "bold" },
        b = { bg = tp(cp.surface1), fg = cp.red },
    },
    inactive = {
        a = { bg = cp.blue, fg = cp.mantle },
        b = { bg = tp(cp.mantle), fg = cp.surface1, gui = "bold" },
        c = { bg = tp(cp.mantle), fg = cp.overlay0 },
    },
}
