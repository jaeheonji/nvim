local present, neo_tree = pcall(require, "neo-tree")
if not present then
    return
end

local M = {}

local default = {
    popup_border_style = "single",
    window = {
        mappings = {
            ["<space>"] = "",
            ["s"] = "open_split",
            ["v"] = "open_vsplit",
        },
    },
}

function M.setup()
    neo_tree.setup(default)
end

return M
