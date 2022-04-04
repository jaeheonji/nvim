local present, smart_splits = pcall(require, "smart-splits")
if not present then
    return
end

local M = {}

local default = {
    ignored_filetypes = {
        "neo-tree",
    },
}

function M.setup()
    smart_splits.setup(default)

    require("core.key-bindings").smart_splits()
end

return M
