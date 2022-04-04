local present, smart_splits = pcall(require, "smart-splits")
if not present then
    return
end

local M = {}

local default_settings = {
    ignored_filetypes = {
        "neo-tree",
    },
}

M.setup = function()
    smart_splits.setup(default_settings)

    require("core.key-bindings").smart_splits()
end

return M
