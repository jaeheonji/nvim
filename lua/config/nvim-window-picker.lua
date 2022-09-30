local ok, picker = pcall(require, "window-picker")
if not ok then
    return
end

local cp = require("catppuccin.palettes").get_palette()

local settings = require("core.utils").override("window-picker", {
    autoselect_one = true,
    include_current = false,
    filter_rules = {
        -- filter using buffer options
        bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
            buftype = { "terminal" },
        },
    },

    fg_color = cp.blue,
    current_win_hl_color = cp.mantle,
    other_win_hl_color = cp.mantle,
})

picker.setup(settings)
