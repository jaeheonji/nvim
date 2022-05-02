local ok, window_picker = pcall(require, "window-picker")
if not ok then
    return
end

local M = {}

local default_settings = {
    autoselect_one = true,
    include_current = false,

    filter_rules = {
        bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix" },
            buftype = { "terminal" },
        },
    },

    other_win_hl_color = require("themes.utils").extract("WindowPickerLine", "background"),
}

M.setup = function()
    window_picker.setup(default_settings)
end

return M
