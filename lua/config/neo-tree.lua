local ok, neo_tree = pcall(require, "neo-tree")
if not ok then
    return
end

local settings = require("core.utils").override("neo-tree", {
    popup_border_style = "single",

    default_component_configs = {
        indent = {
            padding = 2,
            with_expanders = true
        }
    }
})

neo_tree.setup(settings)
