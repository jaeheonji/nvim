local present, neo_tree = pcall(require, "neo-tree")
if not present then
    return
end

local M = {}

local default_settings = {
    popup_border_style = "single",
    window = {
        mappings = {
            ["<space>"] = "",
            ["s"] = "split_with_window_picker",
            ["v"] = "vsplit_with_window_picker",
        },
    },
}

M.setup = function()
    neo_tree.setup(default_settings)
end

return M
