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
            ["s"] = "open_split",
            ["v"] = "open_vsplit",
        },
    },
}

M.setup = function()
    neo_tree.setup(default_settings)

    require("core.colors").neo_tree()
end

return M
