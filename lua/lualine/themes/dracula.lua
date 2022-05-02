local cp = require("themes.dracula").get_colors()
local tp = require("themes.utils").tp

return {
    normal = {
        a = { bg = cp.purple, fg = cp.bgdarker, gui = "bold" },
        b = { bg = tp(cp.bgdark), fg = cp.purple },
        c = { bg = tp(cp.bgdarker), fg = cp.fg },
    },
    insert = {
        a = { bg = cp.green, fg = cp.bgdarker, gui = "bold" },
        b = { bg = tp(cp.bgdark), fg = cp.green },
    },
    command = {
        a = { bg = cp.pink, fg = cp.bgdarker, gui = "bold" },
        b = { bg = tp(cp.bgdark), fg = cp.pink },
    },
    visual = {
        a = { bg = cp.yellow, fg = cp.bgdarker, gui = "bold" },
        b = { bg = tp(cp.bgdark), fg = cp.yellow },
    },
    replace = {
        a = { bg = cp.orange, fg = cp.bgdarker, gui = "bold" },
        b = { bg = tp(cp.bgdark), fg = cp.orange },
    },
    inactive = {
        a = { bg = cp.purple, fg = cp.bgdarker, gui = "bold" },
        b = { bg = tp(cp.bgdarker), fg = cp.purple },
        c = { bg = tp(cp.bgdarker), fg = cp.comment },
    },
}
